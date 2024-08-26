import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/MaritalModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/ModelClasses/UserProfileModel.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool iseditable = false;
  ScrollController _scrollController = ScrollController();
  ApiProvider _apiProvider = ApiProvider();
  late UserProfile _userProfile ;//= UserProfile();
  bool showhideloader = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController businessEmailController = TextEditingController();
  TextEditingController dojController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cobController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController supervisorController = TextEditingController();
  TextEditingController maritialtatusController = TextEditingController();
  String dropdownvalue = 'India';
  String dropdownvalue2 = 'Mar';
  String dropdownvalue3 = '';
  DateTime selectedDate = DateTime.now();
  final TextEditingController date = TextEditingController();
  late CountryListModel _countrylist;// = CountryListModel();
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
  late Marital _relationlist ;//= Marital();
  List<Datum> newrelationlist = [
    Datum(
        id: 0,
        dateCreated: DateTime.now(),
        dateModified: DateTime.now(),
        description: '',
        code: '',
        createdBy: '', modifiedBy: '')
  ];
  late Datum selectednewrelationlist;
  onPressOfDone() async {
    setState(() {
      showhideloader = true;
    });
    _userProfile.firstName = firstNameController.text;
    _userProfile.lastName = lastNameController.text;
    _userProfile.middleName = middleNameController.text;
    _userProfile.userName = userNameController.text;
    _userProfile.dob = dobController.text;
    _userProfile.doj = dojController.text;
    _userProfile.email = emailController.text;
    _userProfile.nationality = dropdownvalue3;
    _userProfile.supervisorName = supervisorController.text;
    _userProfile.maritalStatus = dropdownvalue2;
    _userProfile.countryOfBirth = dropdownvalue;

    print(_userProfile.countryOfBirth);
    UserInfo res = await _apiProvider.update_UserProfile(_userProfile);
    // print(res.data.firstName);
    setState(() {
      iseditable = false;
      showhideloader = false;
    });
  }

  @override
  void initState() {
    super.initState();

    // _apiProvider.getCountrylist('');
    _apiProvider
        .get_user_profile()
        .then((value) => this.setState(() {
              // print('doj value ${value.data[0].doj}');
              _userProfile = value.data[0];

              // newrelationlist.add(Datum(
              //     id: 0,
              //     dateCreated: DateTime.now(),
              //     dateModified: DateTime.now(),
              //     description: value.data[0].maritalStatus,
              //     code: value.data[0].maritalStatus,
              //     createdBy: value.data[0].maritalStatus));
              // selectednewCountry2List = CountryModel(
              //     id: 1,
              //     dateCreated: '',
              //     dateModified: '',
              //     stateId: '',
              //     countryId: '',
              //     name: value.data[0].countryOfBirth,
              //     sortname: '',
              //     modifiedBy: '',
              //     organization: '',
              //     status: true,
              //     createdBy: '');
              // selectednewCountry3List = CountryModel(
              //     id: 1,
              //     dateCreated: '',
              //     dateModified: '',
              //     stateId: '',
              //     countryId: '',
              //     name: value.data[0].nationality,
              //     sortname: '',
              //     modifiedBy: '',
              //     organization: '',
              //     status: true,
              //     createdBy: '');

              dobController.text =
                  value.data[0].dob != null ? value.data[0].dob : '';
              dojController.text =
                  value.data[0].doj != null ? value.data[0].doj : '';
              // dobController.text =value.data[0].dob != null
              //     ? getDepartureTime(value.data[0].dob).toString()
              //     : '';
              // dojController.text = value.data[0].doj != null
              //     ? getDepartureTime(value.data[0].doj).toString()
              //     : '';
              //getDepartureTime(value.data[0].doj)

              getdata();
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));

    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Future<Null> getdata() async {
    await _apiProvider
        .getCountrylist(countryId: '')
        .then((value) => this.setState(() {
              newCountry2List = value.data;
              for (var i = 0; i < newCountry2List.length; i++) {
                if (newCountry2List[i].name == _userProfile.countryOfBirth) {
                  selectednewCountry2List = newCountry2List[i];
                  dropdownvalue = newCountry2List[i].name;
                }
                if (newCountry2List[i].name == _userProfile.nationality) {
                  selectednewCountry3List = newCountry2List[i];
                  dropdownvalue3 = newCountry2List[i].name;
                }
              }
              getmaritallist();
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  getmaritallist() async {
    await _apiProvider
        .getMaritallist()
        .then((value) => this.setState(() {
              // print('data of mariatal ${value}');
              newrelationlist = value.data;
              for (var i = 0; i < newrelationlist.length; i++) {
                if (newrelationlist[i].code == _userProfile.maritalStatus) {
                  selectednewrelationlist = newrelationlist[i];
                  dropdownvalue2 = newrelationlist[i].code;
                }
              }

              showhideloader = false;
            }))
        .onError((error, stackTrace) => this.setState(() {
              showhideloader = false;
            }));
  }

  Future<Null> selectDate(
      BuildContext context, TextEditingController data) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != selectedDate) {
      selectedDate = picked!;

      data.value = TextEditingValue(
          text: DateFormat('dd/MM/yyyy').format(picked).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // bottom: true,
      top: false,
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text("Personal Information",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                this.setState(() {
                  iseditable = !iseditable;
                });
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                height: 23,
                width: 23,
                child: Image.asset(
                  'assets/images/edit.png',
                  fit: BoxFit.contain,
                  color: iseditable
                      ? Colors.black12
                      : AppConstants.APP_THEME_COLOR,
                ),
              ),
            ),
          ],
        ),
        body: showhideloader
            ? Container(
                width: Get.height,
                child: showMobilityLoader(showhideloader, Colors.transparent),
              )
            : Container(
                height: 100.0.h,
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
                              'User Name',
                              'Enter User Name',
                              iseditable,
                              false,
                              myText: _userProfile.userName,
                              textController: userNameController,
                            ),
                            ColumnWidget(
                              'Business Email',
                              'Enter Business Email',
                              iseditable,
                              false,
                              myText: _userProfile.email,
                              textController: businessEmailController,
                            ),
                            ColumnWidget(
                              'First Name',
                              'Enter First Name',
                              iseditable,
                              false,
                              myText: _userProfile.firstName,
                              textController: firstNameController,
                            ),
                            ColumnWidget(
                              'Middle Name',
                              'Enter Middle Name',
                              iseditable,
                              false,
                              myText: _userProfile.middleName,
                              textController: middleNameController,
                            ),
                            ColumnWidget(
                              'Last Name',
                              'Enter Last Name',
                              iseditable,
                              false,
                              myText: _userProfile.lastName,
                              textController: lastNameController,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Date of Joining',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                      )),
                                  //SizedBox(height: 5),
                                  GestureDetector(
                                    onTap: () => iseditable
                                        ? selectDate(context, dojController)
                                        : null,
                                    child: TextFormField(
                                      // controller: _userProfile.dob != null
                                      //     ? getDepartureTime(_userProfile.dob)
                                      //     : "",
                                      controller: dojController,
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
                                            color: iseditable
                                                ? AppConstants.APP_THEME_COLOR
                                                : Colors.grey,
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
                            // ColumnWidget(
                            //   'Date of Joining',
                            //   'Enter Date',
                            //   iseditable,
                            //   true,
                            //   icon: Icons.calendar_today_rounded,
                            //   // myText: _userProfile.dateCreated != null
                            //   //     ? getDepartureTime(_userProfile.dateCreated)
                            //   //     : "",
                            //   textController: dojController,
                            // ),
                            ColumnWidget(
                              'Email Address',
                              'Enter Email Address',
                              iseditable,
                              false,
                              myText: _userProfile.email,
                              textController: emailController,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Country of Birth',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                      )),
                                  //SizedBox(height: 5),
                                  IgnorePointer(
                                      ignoring: iseditable ? false : true,
                                      child: DropdownButton<CountryModel>(
                                        // Initial Value
                                        underline: Container(
                                          height: 1,
                                          color: AppConstants.APP_THEME_COLOR,
                                        ),
                                        isExpanded: true,
                                        hint: Text('Select Country of Birth'),
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
                                            color:
                                                AppConstants.APP_THEME_COLOR),

                                        // Array list of items
                                        items: newCountry2List
                                            .map((CountryModel items) {
                                          return DropdownMenuItem<CountryModel>(
                                            value: items,
                                            child: Text(items.name == null
                                                ? ''
                                                : items.name),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          iseditable
                                              ? setState(() {
                                                  selectednewCountry3List =
                                                      newValue!;
                                                  dropdownvalue = newValue.name;
                                                })
                                              : null;
                                        },
                                      )),
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
                                        'Marital Status',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                      )),
                                  //SizedBox(height: 5),
                                  IgnorePointer(
                                      ignoring: iseditable ? false : true,
                                      child: DropdownButton<Datum>(
                                        // Initial Value
                                        underline: Container(
                                          height: 1,
                                          color: AppConstants.APP_THEME_COLOR,
                                        ),
                                        isExpanded: true,
                                        hint: Text('Select Marital Status'),
                                        value: selectednewrelationlist,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          height: 1.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),

                                        // Down Arrow Icon
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down,
                                            color:
                                                AppConstants.APP_THEME_COLOR),

                                        // Array list of items
                                        items: newrelationlist.length > 0
                                            ? newrelationlist
                                                .map((Datum items) {
                                                return DropdownMenuItem<Datum>(
                                                  value: items,
                                                  child: Text(items.code == null
                                                      ? ''
                                                      : items.code),
                                                );
                                              }).toList()
                                            : null,
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectednewrelationlist = newValue!;
                                            dropdownvalue2 = newValue.code;
                                          });
                                        },
                                      )),
                                ],
                              ),
                            ),

                            // ColumnWidget(
                            //   'Marital Status',
                            //   'Select Marital Status',
                            //   iseditable,
                            //   true,
                            //   myText: _userProfile.maritalStatus,
                            //   textController: maritialtatusController,
                            // ),
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
                                    onTap: () => iseditable
                                        ? selectDate(context, dobController)
                                        : null,
                                    child: TextFormField(
                                      // controller: _userProfile.dob != null
                                      //     ? getDepartureTime(_userProfile.dob)
                                      //     : "",
                                      controller: dobController,
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
                                            color: iseditable
                                                ? AppConstants.APP_THEME_COLOR
                                                : Colors.grey,
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

                            Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Nationality',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: AppConstants
                                                .TEXT_BACKGROUND_COLOR,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                      )),
                                  //SizedBox(height: 5),
                                  IgnorePointer(
                                      ignoring: iseditable ? false : true,
                                      child: DropdownButton<CountryModel>(
                                        // Initial Value
                                        underline: Container(
                                          height: 1,
                                          color: AppConstants.APP_THEME_COLOR,
                                        ),
                                        isExpanded: true,
                                        hint: Text('Select Nationality'),
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
                                            color:
                                                AppConstants.APP_THEME_COLOR),

                                        // Array list of items
                                        items: newCountry2List
                                            .map((CountryModel items) {
                                          return DropdownMenuItem<CountryModel>(
                                            value: items,
                                            child: Text(items.name == null
                                                ? ''
                                                : items.name),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (newValue) {
                                          iseditable
                                              ? setState(() {
                                                  selectednewCountry2List =
                                                      newValue!;
                                                  dropdownvalue3 =
                                                      newValue.name;
                                                })
                                              : null;
                                        },
                                      )),
                                ],
                              ),
                            ),

                            ColumnWidget(
                              'Supervisor',
                              'Search...',
                              iseditable,
                              false,
                              myText: _userProfile.supervisorName,
                              textController: supervisorController,
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
                              'DONE',
                              style: TextStyle(fontSize: 20.0),
                              textAlign: TextAlign.center,
                            ),
                            // textColor: Colors.white,
                            // color: AppConstants.APP_THEME_COLOR,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            onPressed: () {
                              iseditable
                                  ? onPressOfDone()
                                  : Navigator.pushNamed(context, '/Dashboard');
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
              ),
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
      {this.icon, this.myText, this.textController}
      //{@required this.onTap}
      );
  String? myText;
  IconData? icon;
  final String label;
  final bool iseditable;
  final bool showDropdown;
  final dynamic hint;
  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    textController!.text = myText.toString();
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
