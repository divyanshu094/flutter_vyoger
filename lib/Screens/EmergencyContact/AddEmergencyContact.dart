import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/CountryCodeModel.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';

// import 'package:mobility_sqr/ModelClasses/DialCodeModel.dart';
import 'package:mobility_sqr/ModelClasses/EmergencyContactModel.dart';
import 'package:mobility_sqr/ModelClasses/GenderModel.dart';
import 'package:mobility_sqr/ModelClasses/NewEmergencyModel.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/Screens/EmergencyContact/EmergencyScreen.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/ToastCustom.dart';
// import 'package:sizer/sizer_ext.dart';

class AddEmergencyContact extends StatefulWidget {
  @override
  _AddEmergencyContactState createState() => _AddEmergencyContactState();
}

class _AddEmergencyContactState extends State<AddEmergencyContact> {
  late NewEmergency _list; // = NewEmergency();
  ScrollController _scrollController = ScrollController();
  ApiProvider _apiProvider = ApiProvider();
  late UserProfile _userProfile; //= UserProfile();
  late EmergencyModel _emergencydata; //= EmergencyModel();
  bool showhideloader = true;
  String dropdownvalue = 'India';
  late RelationList _relationList; //= RelationList();
  late CountryListModel _countrylist; // = CountryListModel();
  late CountryListModel _statelist; //= CountryListModel();
  List<CountryModel> newCountry2List = [
    CountryModel(
        id: 1,
        dateCreated: '',
        dateModified: '',
        stateId: '',
        countryId: '',
        name: '',
        sortname: '',
        modifiedBy: '',
        organization: '',
        status: true,
        createdBy: '')
  ];
  late CountryModel selectednewCountry2List;
  late CountryModel selectednewCountry3List;
  late Gender _genderlist; //= Gender();
  List<GenderModel> gendernewlist = [
    GenderModel(
        code: '',
        id: 0,
        dateCreated: DateTime.now(),
        dateModified: DateTime.now(),
        modifiedBy: '',
        status: true,
        description: '')
  ];
  late GenderModel selectedgendernewlist;
  late Countrycode _dialcodelist; // = Countrycode();
  List<CodeModel> newdialcodelist = [
    CodeModel(
        id: 0,
        dateCreated: DateTime.now(),
        modifiedBy: '',
        code: '',
        createdBy: '',
        status: true,
        name: '',
        dateModified: DateTime.now(),
        dialCode: '',
        organization: '')
  ];
  late CodeModel selectednewdialcodelist;
  late CodeModel selectednewdialcodelist2;
  DateTime selectedDate = DateTime.now();
  bool primary = false;
  bool dependent = false;
  bool emergency_Contact = false;
  bool copy_address = false;
  String relation_value = '';
  String phCountry_value = '';
  String altPhCountry_value = '';
  String gender_value = '';
  String country_value = '';
  String state_value = '';
  String dob_value = '';
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController altphonecontroller = TextEditingController();
  TextEditingController address1controller = TextEditingController();
  TextEditingController address2controller = TextEditingController();
  TextEditingController address3controller = TextEditingController();
  List<Relation> relationList = [];
  late Relation selectedRelation;
  TokenGetter _getter = TokenGetter();
  List emergencydatalist = [];

  @override
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 100), curve: Curves.ease);
    });
    this.setState(() {
      showhideloader = true;
    });
    getRelationList();

    getemergencylist();
    super.initState();
  }

  getCountrylist() {
    _apiProvider
        .getCountrylist(countryId: '')
        .then((value) => this.setState(() {
              _countrylist = value;
              showhideloader = false;
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  getGenderlist() {
    _apiProvider
        .getGenderlist()
        .then((value) => this.setState(() {
              _genderlist = value;
              // showhideloader = false;
              getCountrycodelist();
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  getCountrycodelist() {
    this.setState(() {
      showhideloader = true;
    });
    _apiProvider
        .getCountryCodelist()
        .then((value) => this.setState(() {
              _dialcodelist = value;
              // showhideloader = false;
              getCountrylist();
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  getRelationList() async {
    RelationList data = await _getter.readRelationList();
    this.setState(() {
      relationList.addAll(data.data);
    });
    getGenderlist();
  }

  getemergencylist() {
    _apiProvider
        .get2EmergencyContact()
        .then((value) => this.setState(() {
              print('emrgency data ${value.data?.length}');
              _list = value;
            }))
        .onError((error, stackTrace) => print('error'));
  }

  // getCitylist(String data) {
  //   _apiProvider
  //       .getCitylist(countryId: data)
  //       .then((value) => this.setState(() {
  //             newCountry2List = value.data;
  //           }))
  //       .onError((error, stackTrace) => print('error'));
  // }

  onPressOfDone(Datae updated_data) async {
    UserInfo userInfo = await TokenGetter().readUserInfo() ?? null;
    String empMail = userInfo.data.empCode;
    if (namecontroller.text.trim() == '' ||
        phCountry_value == '' ||
        phonecontroller.text.trim() == '' ||
        gender_value == '' ||
        emailcontroller.text.trim() == '' ||
        address1controller.text.trim() == '' ||
        country_value == '' ||
        state_value == '' ||
        citycontroller.text.trim() == '' ||
        zipcodecontroller.text.trim() == '') {
      print('fill the data');
    } else {
      // var a = {
      //   "name": namecontroller.text,
      //   "relationship": relation_value,
      //   "primary_flag": primary,
      //   "phone": phonecontroller.text,
      //   "country_code": phCountry_value,
      //   "second_phone": altphonecontroller.text,
      //   "second_country_code": altPhCountry_value,
      //   "isDependent": dependent,
      //   "isEmergencyContact": emergency_Contact,
      //   "gender": gender_value,
      //   "column1": dobcontroller.text,
      //   "email": emailcontroller.text,
      //   "isAddSameAsEmployee": copy_address,
      //   "address1": address1controller.text,
      //   "address2": address2controller.text,
      //   "address3": address3controller.text,
      //   "country": country_value,
      //   "state": state_value,
      //   "city": citycontroller.text,
      //   "zip": zipcodecontroller.text,
      //   "emp_code": empMail,
      //   "update_id": updated_data == null ? '' : updated_data.id
      // };
      // print('_list.data.length  ${jsonEncode(a)}');
      // return;
      // print('_list.data.length  ${_list.data}');
      this.setState(() {
        showhideloader = true;
      });
      for (var i = 0; i < _list.data!.length; i++) {
        print('list data>>>>${_list.data?[i]}');
        emergencydatalist.add({
          "name": _list.data?[i].name,
          "relationship": _list.data?[i].relationship,
          "primary_flag": _list.data?[i].primaryFlag,
          "phone": _list.data?[i].phone,
          "country_code": _list.data?[i].countryCode,
          "second_phone": _list.data?[i].secondPhone,
          "second_country_code": _list.data?[i].secondCountryCode,
          "isDependent": _list.data?[i].isDependent,
          "isEmergencyContact": _list.data?[i].isEmergencyContact,
          "gender": _list.data?[i].gender,
          "column1": _list.data?[i].column1?.toLocal().toIso8601String(),
          "email": _list.data?[i].email,
          "isAddSameAsEmployee": _list.data?[i].isAddSameAsEmployee,
          "address1": _list.data?[i].address1,
          "address2": _list.data?[i].address2,
          "address3": _list.data?[i].address3,
          "country": _list.data?[i].country,
          "state": _list.data?[i].state,
          "city": _list.data?[i].city,
          "zip": _list.data?[i].zip,
          "emp_code": _list.data?[i].empCode,
          "update_id": _list.data?[i].id
        });
      }

      emergencydatalist.add({
        "name": namecontroller.text,
        "relationship": relation_value,
        "primary_flag": primary,
        "phone": phonecontroller.text,
        "country_code": phCountry_value,
        "second_phone": altphonecontroller.text,
        "second_country_code": altPhCountry_value,
        "isDependent": dependent,
        "isEmergencyContact": emergency_Contact,
        "gender": gender_value,
        "column1": dob_value,
        "email": emailcontroller.text,
        "isAddSameAsEmployee": copy_address,
        "address1": address1controller.text,
        "address2": address2controller.text,
        "address3": address3controller.text,
        "country": country_value,
        "state": state_value,
        "city": citycontroller.text,
        "zip": zipcodecontroller.text,
        "emp_code": empMail,
        "update_id": updated_data == null ? '' : updated_data.id
      });

      // print('new data of emergency  $emergencydatalist');
      _apiProvider
          .postEmergencyContact(emergencydatalist)
          .then((value) => this.setState(() {
                _list = value;
                Navigator.pop(context, true);
                // Navigator.pop(
                //   context,
                //   MaterialPageRoute(builder: (context) => EmergencyContact()),
                // );
              }))
          .onError((error, stackTrace) {
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => EmergencyContact()),
        );
        this.setState(() {
          showhideloader = false;
        });
      });
    }
  }

  Future<Null> selectDate(
      BuildContext context, TextEditingController data) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime.now());
    if (picked != selectedDate) {
      selectedDate = picked!;
      dob_value = picked.toLocal().toIso8601String();
      // print('date birth seected  $picked');
      data.value = TextEditingValue(
          text: DateFormat('dd/MM/yyyy').format(picked).toString());
    }
  }

  Widget build(BuildContext context) {
    Datae data1 = ModalRoute.of(context)?.settings.arguments as Datae;
    // print('new emergrncy data ashish ${data1}');
    namecontroller.text = data1.name;
    primary = data1.primaryFlag;
    phCountry_value = data1.countryCode;
    phonecontroller.text = data1.phone;
    altPhCountry_value = data1.secondCountryCode;
    altphonecontroller.text = data1.secondPhone;
    address1controller.text = data1.address1;
    address2controller.text = data1.address2;
    address3controller.text = data1.address3;
    citycontroller.text = data1.city;
    zipcodecontroller.text = data1.zip;
    copy_address = data1.isAddSameAsEmployee;
    // dobcontroller.text = data1.
    emailcontroller.text = data1.email;
    emergency_Contact = data1.isEmergencyContact;
    dependent = data1.isDependent;
    relation_value = data1.relationship;
    country_value = data1.country;
    state_value = data1.state;
    gender_value = data1.gender;
    return SafeArea(
      // bottom: true,
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text("Add Emergency Contact",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: showhideloader
            ? Container(
                width: Get.height,
                child: showMobilityLoader(showhideloader, Colors.transparent),
              )
            : Builder(builder: (ctx) {
                return Container(
                  height: 100.0,
                  margin: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.8,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          reverse: true,
                          child: Column(
                            children: [
                              ColumnWidget(
                                'Name',
                                'Enter Name',
                                true,
                                false,
                                textController: namecontroller,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Relation',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    DropdownButton<Relation>(
                                      // Initial Value
                                      underline: Container(
                                        height: 1,
                                        color: AppConstants.APP_THEME_COLOR,
                                      ),
                                      isExpanded: true,
                                      hint: Text(data1 != null
                                          ? data1.relationship
                                          : 'Select Relation'),
                                      value: selectedRelation,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),

                                      // Down Arrow Icon
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppConstants.APP_THEME_COLOR),

                                      // Array list of items
                                      items: relationList != null
                                          ? relationList.map((Relation value) {
                                              return DropdownMenuItem<Relation>(
                                                value: value,
                                                child: Text(value.description),
                                              );
                                            }).toList()
                                          : null,
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        selectedRelation = newValue!;
                                        setState(() {
                                          relation_value =
                                              newValue.description.toString();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Primary',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0),
                                          )),
                                    ),
                                    SizedBox(height: 5),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: FlutterSwitch(
                                    //       height: 25.0,
                                    //       width: 60.0,
                                    //       padding: 2.0,
                                    //       toggleSize: 25.0,
                                    //       borderRadius: 12.0,
                                    //       valueFontSize: 12,
                                    //       showOnOff: true,
                                    //       inactiveColor: Colors.black12,
                                    //       activeColor:
                                    //           AppConstants.APP_THEME_COLOR,
                                    //       value: primary,
                                    //       onToggle: (value) {
                                    //         print(value);
                                    //         this.setState(() {
                                    //           primary = value;
                                    //         });
                                    //       },
                                    //     )),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 0,
                                                    groupValue: primary ? 0 : 1,
                                                    onChanged: (value) {
                                                      print(
                                                          'radio value $value');
                                                      if (value == 0) {
                                                        this.setState(() {
                                                          primary = true;
                                                        });
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("Yes"),
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 1,
                                                    groupValue: primary ? 0 : 1,
                                                    onChanged: (value) {
                                                      if (value == 1) {
                                                        this.setState(() {
                                                          primary = false;
                                                        });
                                                        // visatype2 = 'Business';
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("No"),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Phone',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<CodeModel>(
                                                // Initial Value
                                                isExpanded: true,
                                                underline: Container(
                                                  height: 1,
                                                  color: AppConstants
                                                      .APP_THEME_COLOR,
                                                ),
                                                // isExpanded: false,
                                                hint: Text(
                                                    data1.countryCode != ''
                                                        ? data1.countryCode
                                                        : 'Select Code'),
                                                value: selectednewdialcodelist,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 1.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),

                                                // Down Arrow Icon
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppConstants
                                                        .APP_THEME_COLOR),

                                                // Array list of items
                                                items: _dialcodelist.data
                                                    .map((CodeModel items) {
                                                  return DropdownMenuItem<
                                                      CodeModel>(
                                                    value: items,
                                                    child: Text(items
                                                                .dialCode ==
                                                            null
                                                        ? items.name
                                                        : items.code
                                                                .toString() +
                                                            ' (' +
                                                            items.dialCode
                                                                .toString() +
                                                            ')'),
                                                  );
                                                }).toList(),
                                                // After selecting the desired option,it will
                                                // change button value to selected value
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectednewdialcodelist =
                                                        newValue!;
                                                    phCountry_value = newValue
                                                            .code
                                                            .toString() +
                                                        ' (' +
                                                        newValue.dialCode
                                                            .toString() +
                                                        ')';
                                                  });
                                                },
                                              )),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: phonecontroller,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLength: 10,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(),
                                                hintText: 'Enter Phone Number',
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Alternate Number',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<CodeModel>(
                                                // Initial Value
                                                isExpanded: true,
                                                underline: Container(
                                                  height: 1,
                                                  color: AppConstants
                                                      .APP_THEME_COLOR,
                                                ),
                                                // isExpanded: false,
                                                hint: Text(
                                                    data1.secondCountryCode !=
                                                            ''
                                                        ? data1
                                                            .secondCountryCode
                                                        : 'Select Code'),
                                                value: selectednewdialcodelist2,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  height: 1.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                ),

                                                // Down Arrow Icon
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppConstants
                                                        .APP_THEME_COLOR),

                                                // Array list of items
                                                items: _dialcodelist.data
                                                    .map((CodeModel items) {
                                                  return DropdownMenuItem<
                                                          CodeModel>(
                                                      value: items,
                                                      child: Text(items
                                                                  .dialCode ==
                                                              null
                                                          ? items.name
                                                          : items.code
                                                                  .toString() +
                                                              ' (' +
                                                              items.dialCode
                                                                  .toString() +
                                                              ')'));
                                                }).toList(),
                                                // After selecting the desired option,it will
                                                // change button value to selected value
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectednewdialcodelist2 =
                                                        newValue!;
                                                    altPhCountry_value =
                                                        newValue.code
                                                                .toString() +
                                                            ' (' +
                                                            newValue.dialCode
                                                                .toString() +
                                                            ')';
                                                  });
                                                },
                                              )),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: altphonecontroller,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              height: 1.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            maxLength: 10,
                                            decoration: InputDecoration(
                                                isDense: true,
                                                border: UnderlineInputBorder(),
                                                hintText:
                                                    'Enter Alt Phone Number',
                                                focusedBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppConstants
                                                            .APP_THEME_COLOR))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Dependent',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0),
                                          )),
                                    ),
                                    SizedBox(height: 5),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: FlutterSwitch(
                                    //       height: 25.0,
                                    //       width: 60.0,
                                    //       padding: 2.0,
                                    //       toggleSize: 25.0,
                                    //       borderRadius: 12.0,
                                    //       valueFontSize: 12,
                                    //       showOnOff: true,
                                    //       inactiveColor: Colors.black12,
                                    //       activeColor:
                                    //           AppConstants.APP_THEME_COLOR,
                                    //       value: dependent,
                                    //       onToggle: (value) {
                                    //         print(value);
                                    //         this.setState(() {
                                    //           dependent = value;
                                    //         });
                                    //       },
                                    //     )),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 0,
                                                    groupValue:
                                                        dependent ? 0 : 1,
                                                    onChanged: (value) {
                                                      print(
                                                          'radio value $value');
                                                      if (value == 0) {
                                                        this.setState(() {
                                                          dependent = true;
                                                        });
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("Yes"),
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 1,
                                                    groupValue:
                                                        dependent ? 0 : 1,
                                                    onChanged: (value) {
                                                      if (value == 1) {
                                                        this.setState(() {
                                                          dependent = false;
                                                        });
                                                        // visatype2 = 'Business';
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("No"),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Emergency Contact',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0),
                                          )),
                                    ),
                                    SizedBox(height: 5),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: FlutterSwitch(
                                    //       height: 25.0,
                                    //       width: 60.0,
                                    //       padding: 2.0,
                                    //       toggleSize: 25.0,
                                    //       borderRadius: 12.0,
                                    //       valueFontSize: 12,
                                    //       showOnOff: true,
                                    //       inactiveColor: Colors.black12,
                                    //       activeColor:
                                    //           AppConstants.APP_THEME_COLOR,
                                    //       value: emergency_Contact,
                                    //       onToggle: (value) {
                                    //         print(value);
                                    //         this.setState(() {
                                    //           emergency_Contact = value;
                                    //         });
                                    //       },
                                    //     )),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 0,
                                                    groupValue:
                                                        emergency_Contact
                                                            ? 0
                                                            : 1,
                                                    onChanged: (value) {
                                                      print(
                                                          'radio value $value');
                                                      if (value == 0) {
                                                        this.setState(() {
                                                          emergency_Contact =
                                                              true;
                                                        });
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("Yes"),
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 1,
                                                    groupValue:
                                                        emergency_Contact
                                                            ? 0
                                                            : 1,
                                                    onChanged: (value) {
                                                      if (value == 1) {
                                                        this.setState(() {
                                                          emergency_Contact =
                                                              false;
                                                        });
                                                        // visatype2 = 'Business';
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("No"),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Gender',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    DropdownButton<GenderModel>(
                                      // Initial Value
                                      underline: Container(
                                        height: 1,
                                        color: AppConstants.APP_THEME_COLOR,
                                      ),
                                      isExpanded: true,
                                      hint: Text(data1.gender != ''
                                          ? data1.gender
                                          : 'Select Gender'),
                                      value: selectedgendernewlist,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),

                                      // Down Arrow Icon
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppConstants.APP_THEME_COLOR),

                                      // Array list of items
                                      items: _genderlist.data
                                          .map((GenderModel items) {
                                        return DropdownMenuItem<GenderModel>(
                                          value: items,
                                          child: Text(items.description),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        // print('gender data ${newValue.code}');
                                        setState(() {
                                          selectedgendernewlist = newValue!;
                                          gender_value = newValue.code;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Date of Birth',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: () =>
                                          selectDate(context, dobcontroller),
                                      child: TextFormField(
                                        // controller: _userProfile.dob != null
                                        //     ? getDepartureTime(_userProfile.dob)
                                        //     : "",
                                        controller: dobcontroller,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.calendar_today_rounded,
                                              color:
                                                  AppConstants.APP_THEME_COLOR,
                                              size: 25,
                                            ),
                                            // contentPadding: EdgeInsets.fromLTRB(0, 9, 0, 7),
                                            enabled: false,
                                            isDense: true,
                                            border: UnderlineInputBorder(),
                                            hintText: 'Enter Date',
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: AppConstants
                                                        .APP_THEME_COLOR))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ColumnWidget(
                                'Email',
                                'Enter Email',
                                true,
                                false,
                                textController: emailcontroller,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Copy Address From Employee',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: AppConstants
                                                    .TEXT_BACKGROUND_COLOR,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0),
                                          )),
                                    ),
                                    SizedBox(height: 5),
                                    // Align(
                                    //     alignment: Alignment.centerRight,
                                    //     child: FlutterSwitch(
                                    //       height: 25.0,
                                    //       width: 60.0,
                                    //       padding: 2.0,
                                    //       toggleSize: 25.0,
                                    //       borderRadius: 12.0,
                                    //       valueFontSize: 12,
                                    //       showOnOff: true,
                                    //       inactiveColor: Colors.black12,
                                    //       activeColor:
                                    //           AppConstants.APP_THEME_COLOR,
                                    //       value: copy_address,
                                    //       onToggle: (value) {
                                    //         print(value);
                                    //         this.setState(() {
                                    //           copy_address = value;
                                    //         });
                                    //       },
                                    //     )),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 0,
                                                    groupValue:
                                                        copy_address ? 0 : 1,
                                                    onChanged: (value) {
                                                      print(
                                                          'radio value $value');
                                                      if (value == 0) {
                                                        this.setState(() {
                                                          copy_address = true;
                                                        });
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("Yes"),
                                            Transform.scale(
                                                scale: 1.5,
                                                child: Radio(
                                                    value: 1,
                                                    groupValue:
                                                        copy_address ? 0 : 1,
                                                    onChanged: (value) {
                                                      if (value == 1) {
                                                        this.setState(() {
                                                          copy_address = false;
                                                        });
                                                        // visatype2 = 'Business';
                                                      }
                                                    },
                                                    fillColor: WidgetStateColor
                                                        .resolveWith((states) =>
                                                            AppConstants
                                                                .APP_THEME_COLOR))),
                                            Text("No"),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              ColumnWidget(
                                'Address 1',
                                'Enter Address 1',
                                true,
                                false,
                                textController: address1controller,
                              ),
                              ColumnWidget(
                                'Address 2',
                                'Enter Address 2',
                                true,
                                false,
                                textController: address2controller,
                              ),
                              ColumnWidget(
                                'Address 3',
                                'Enter Address 3',
                                true,
                                false,
                                textController: address3controller,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Country',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    DropdownButton<CountryModel>(
                                      // Initial Value
                                      underline: Container(
                                        height: 1,
                                        color: AppConstants.APP_THEME_COLOR,
                                      ),
                                      isExpanded: true,
                                      hint: Text(data1 != null
                                          ? data1.country
                                          : 'Select Country'),
                                      value: selectednewCountry3List,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),

                                      // Down Arrow Icon
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppConstants.APP_THEME_COLOR),

                                      // Array list of items
                                      items: _countrylist.data
                                          .map((CountryModel items) {
                                        return DropdownMenuItem<CountryModel>(
                                          value: items,
                                          child: Text(items.name),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectednewCountry3List = newValue!;
                                          country_value =
                                              newValue.id.toString();
                                        });
                                        // getCitylist(newValue.countryId);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'State',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppConstants
                                                  .TEXT_BACKGROUND_COLOR,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0),
                                        )),
                                    //SizedBox(height: 5),
                                    DropdownButton<CountryModel>(
                                      // Initial Value
                                      underline: Container(
                                        height: 1,
                                        color: AppConstants.APP_THEME_COLOR,
                                      ),
                                      isExpanded: true,
                                      hint: Text(data1 != null
                                          ? data1.state
                                          : 'Select State'),
                                      value: selectednewCountry2List,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        height: 1.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),

                                      // Down Arrow Icon
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppConstants.APP_THEME_COLOR),

                                      // Array list of items
                                      items: newCountry2List
                                          .map((CountryModel items) {
                                        return DropdownMenuItem<CountryModel>(
                                          value: items,
                                          child: Text(items.name),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectednewCountry2List = newValue!;
                                          state_value = newValue.name;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              ColumnWidget(
                                'City',
                                'Enter City',
                                true,
                                false,
                                textController: citycontroller,
                              ),
                              ColumnWidget(
                                'Zipcode',
                                'Enter Zipcode',
                                true,
                                false,
                                textController: zipcodecontroller,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 0,
                        left: 0,
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 45,
                            child: TextButton(
                              child: Text(
                                'SAVE',
                                style: TextStyle(fontSize: 20.0),
                                textAlign: TextAlign.center,
                              ),
                              // textColor: Colors.white,
                              // color: AppConstants.APP_THEME_COLOR,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(10),
                              // ),
                              onPressed: () {
                                if (namecontroller.text.trim() == '' ||
                                    phCountry_value == '' ||
                                    phonecontroller.text.trim() == '' ||
                                    gender_value == '' ||
                                    emailcontroller.text.trim() == '' ||
                                    address1controller.text.trim() == '' ||
                                    country_value == '' ||
                                    state_value == '' ||
                                    citycontroller.text.trim() == '' ||
                                    zipcodecontroller.text.trim() == '') {
                                  // print(
                                  //     'fill the namecontroller.text ${namecontroller.text}');
                                  // print(
                                  //     'fill the phCountry_value ${phCountry_value}');
                                  // print(
                                  //     'fill the phonecontroller.text ${phonecontroller.text}');
                                  // print(
                                  //     'fill the gender_value ${gender_value}');
                                  // print(
                                  //     'fill the emailcontroller.text ${emailcontroller.text}');
                                  showDefaultSnackbar(
                                      ctx, "Please fill the Mandatory fields");
                                } else {
                                  if (RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(emailcontroller.text)) {
                                    onPressOfDone(data1);
                                  } else {
                                    showDefaultSnackbar(
                                        ctx, "Please enter valid email");
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: Get.height,
                        child: showMobilityLoader(
                            showhideloader, Colors.transparent),
                      )
                    ],
                  ),
                );
              }),
      ),
    );

    // ColumnWidget('assets/images/emergency_contact.png',
    //   "Emergency Contacts", onTap:(){},),
    //    );
  }
}

class ColumnWidget extends StatelessWidget {
  late VoidCallback onTap;

  ColumnWidget(this.label, this.hint, this.iseditable, this.showDropdown,
      {IconData? icon, required this.textController}
      //{@required this.onTap}
      );

  late String myText;
  late IconData icon;
  late final String label;
  late final bool iseditable;
  late final bool showDropdown;
  late final dynamic hint;
  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              )),
          //SizedBox(height: 5),
          TextFormField(
            controller: textController,
            style: TextStyle(
              fontSize: 16.0,
              height: 1.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                suffixIcon: showDropdown
                    ? icon != null
                        ? Icon(
                            icon,
                            color: iseditable
                                ? AppConstants.APP_THEME_COLOR
                                : Colors.grey,
                            size: 25,
                          )
                        : Icon(
                            Icons.arrow_drop_down,
                            color: iseditable
                                ? AppConstants.APP_THEME_COLOR
                                : Colors.grey,
                            size: 25,
                          )
                    : null,
                // contentPadding: EdgeInsets.fromLTRB(0, 9, 0, 7),
                enabled: iseditable,
                isDense: true,
                border: UnderlineInputBorder(),
                hintText: hint,
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppConstants.APP_THEME_COLOR))),
          ),
        ],
      ),
    );
  }
}
