// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:clay_containers/widgets/clay_container.dart';
// import 'package:country_pickers/country.dart';
// import 'package:country_pickers/country_pickers.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_uploader/flutter_uploader.dart';
// import 'package:get/get.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
// import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
// import 'package:mobility_sqr/Constants/AppConstants.dart';
// import 'package:mobility_sqr/FileUpload/FileUploader.dart';
// import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
// import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
// import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
// import 'package:mobility_sqr/ModelClasses/PassportforModel.dart';
// import 'package:mobility_sqr/ModelClasses/RelationList.dart';
// import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
// import 'package:mobility_sqr/Screens/TravelCalendar/customEventWidget.dart';
// import 'package:mobility_sqr/Screens/VaultScreen/Screens/VaultTypeScreen.dart';
// import 'package:mobility_sqr/Util/UtilClass.dart';
// import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
// import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
// import 'package:sizer/sizer.dart';
//
// class AddNewPassport extends StatefulWidget {
//   String empcode;
//   PassportDetail passportdata;
//
//   AddNewPassport(@required this.empcode, @required this.passportdata);
//
//   @override
//   _AddNewPassportState createState() => _AddNewPassportState();
// }
//
// class _AddNewPassportState extends State<AddNewPassport> {
//   late PlatformFile _paths;
//   late String DocPath;
//
//   late File docFile;
//   FileUpload _fileUpload = FileUpload.instance;
//   TextEditingController _doc_name_textcontroller = TextEditingController();
//   late StreamSubscription _progressSubscription;
//   late StreamSubscription _resultSubscription;
//   Map<String, UploadItem> _tasks = {};
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TokenGetter _getter = TokenGetter();
//   List<Relation> relationList = [
//     Relation(
//         id: 100,
//         status: false,
//         code: 'self',
//         description: 'self',
//         dateCreated: '',
//         dateModified: '')
//   ];
//   List<Passortrelation> relationList2 = [];
//   late Relation selectedRelation;
//   late Passortrelation selectedRelation2;
//   bool isPassportActive = true;
//   bool isDuplicatePassport = true;
//
//   ApiProvider _apiProvider = ApiProvider();
//   late List<String> _Countrylist;
//   late List<CountryModel> _CountrylistModel;
//   Country selCountry =
//       Country(name: "Select Country", iso3Code: '', isoCode: '', phoneCode: '');
//   Country selCountryIssue =
//       Country(name: "Select Country", iso3Code: '', isoCode: '', phoneCode: '');
//   late DateTime _dateTimeIssue;
//   late DateTime _dateTimeExpiry;
//
//   ScrollController _scrollController = ScrollController();
//
//   String _pickedFileString = "";
//
//   double _progressValue = 0.0;
//
//   bool showloader = false;
//   bool showloader2 = false;
//   late PassportDetail passportModel; // = PassportDetail();
//   String relationvalue = '';
//   bool passportactive = true;
//   bool duplicatepassport = false;
//   String passportnumber = '';
//   String nationalityvalue = '';
//   String countryvalue = '';
//   String issueplace = '';
//   String issuedate = '';
//   String expirationdate = '';
//   String emptypages = '';
//   String documenturl = '';
//   late List<Passportfor> passportDetaillist2;
//
//   @override
//   void initState() {
//     super.initState();
//
//     relationvalue = widget.passportdata.relation;
//     passportactive = widget.passportdata.passportStatus;
//     duplicatepassport = widget.passportdata.duplicatePassport;
//     passportnumber = widget.passportdata.passportNumber;
//     nationalityvalue = widget.passportdata.nationality;
//     countryvalue = widget.passportdata.countryOfIssue;
//     issueplace = widget.passportdata.placeOfIssue;
//     issuedate = widget.passportdata.dateOfIssue;
//     expirationdate = widget.passportdata.dateOfExpiration;
//     emptypages = widget.passportdata.pagesPassport;
//     documenturl = widget.passportdata.photo;
//
//     passportModel.passportStatus = isPassportActive;
//     passportModel.duplicatePassport = isDuplicatePassport;
//
//     SchedulerBinding.instance.addPostFrameCallback((_) =>
//         _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
//     this.setState(() {
//       selectedRelation = relationList[0];
//     });
//
//     getRelationList();
//     getPassportfor();
//
//     _apiProvider
//         .getCountrylist(countryId: "")
//         .then((value) => CountrySetter(value));
//
//     _progressSubscription = _fileUpload.uploader.progress.listen((progress) {
//       final task = _tasks[progress.tag];
//       print("progress: ${progress.progress} , tag: ${progress.tag}");
//
//       if (task == null) return;
//       if (task.isCompleted()) return;
//
//       this.setState(() {
//         _progressValue = progress.progress!.toDouble();
//         _tasks[progress.tag] =
//             task.copyWith(progress: progress.progress, status: progress.status);
//       });
//     });
//     _resultSubscription = _fileUpload.uploader.result.listen((result) {
//       print(
//           "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");
//
//       var body = result.response;
//
//       _pickedFileString = jsonDecode(child)['data'];
//       this.setState(() {
//         showloader = false;
//       });
//       final task = _tasks[result.tag];
//       if (task == null) return;
//
//       this.setState(() {
//         _tasks[result.tag] = task.copyWith(status: result.status);
//       });
//     }, onError: (ex, stacktrace) {
//       print("exception: $ex");
//       print("stacktrace: $stacktrace" ?? "no stacktrace");
//       final exp = ex as UploadException;
//       final task = _tasks[exp.tag];
//       if (task == null) return;
//
//       this.setState(() {
//         _tasks[exp.tag] = task.copyWith(status: exp.status);
//       });
//     });
//   }
//
//   CountrySetter(value) {
//     this.setState(() {
//       _Countrylist = getShortName(value);
//       _CountrylistModel = value.data;
//     });
//   }
//
//   getShortName(CountryListModel value) {
//     List<String> myCountryCodes = [];
//
//     for (int i = 0; i < value.data.length; i++) {
//       myCountryCodes.add(value.data[i].sortname);
//     }
//
//     return myCountryCodes;
//   }
//
//   getRelationList() async {
//     RelationList data = await _getter.readRelationList();
//     this.setState(() {
//       relationList.addAll(data.data);
//     });
//   }
//
//   getPassportfor() async {
//     await _apiProvider
//         .get_employee_passportfor(empCode: widget.empcode)
//         .then((value) => {
//               this.setState(() {
//                 // print('new ------------ ${value.data.toString()}');
//                 relationList2.add(Passortrelation(
//                     id: 0,
//                     name: "Self",
//                     status: false,
//                     relationship: '',
//                     phone: '',
//                     primaryFlag: true,
//                     secondCountryCode: '',
//                     secondPhone: '',
//                     city: '',
//                     column1: '',
//                     countryCode: '',
//                     country: '',
//                     state: '',
//                     address1: '',
//                     address2: '',
//                     address3: '',
//                     zip: ''));
//                 // relationList2 = value.data;
//                 relationList2.addAll(value.data);
//
//                 showloader = false;
//               }),
//               // print('new passport data ${value.toJson()}')
//             })
//         .catchError((onError) => this.setState(() {
//               this.setState(() {
//                 showloader = false;
//               });
//             }));
//   }
//
//   addPassport(context) async {
//     if (passportnumber.trim() == '' ||
//             relationvalue == '' ||
//             nationalityvalue == '' ||
//             countryvalue == '' ||
//             // issueplace.trim() == '' ||
//             issuedate == '' ||
//             expirationdate == ''
//         // || emptypages.trim() == '' ||
//         // documenturl == ''
//         ) {
//       Get.snackbar('error', 'Please fill the Mandatory fields',
//           backgroundColor: Colors.black, colorText: Colors.white);
//       return;
//       // showDefaultSnackbar(context, "Please fill the Mandatory fields");
//     }
//
//     this.setState(() {
//       showloader2 = true;
//     });
//     var a = [
//       {
//         "passport_status": passportactive,
//         "passport_number": passportnumber,
//         "passport_expiry_date": "",
//         "nationality": nationalityvalue,
//         "country_of_issue": countryvalue,
//         "place_of_issue": issueplace,
//         "date_of_issue": issuedate,
//         "date_of_expiration": expirationdate,
//         "duplicate_passport": duplicatepassport,
//         "pages_passport": emptypages,
//         "isdependent": relationvalue.toLowerCase() == 'self' ? false : true,
//         "photo": documenturl,
//         "relation": relationvalue,
//         "emp_code": passportModel.empCode,
//         "update_id": widget.passportdata != null ? widget.passportdata.id : ""
//       }
//     ];
//     print('params of add passport______  ${jsonEncode(a)}');
//     // return;
//     await _apiProvider
//         .post_employee_passport(data: a)
//         .then((value) => {
//               this.setState(() {
//                 showloader2 = false;
//               }),
//               // VaultScreen
//               Navigator.pop(context, true),
//               Get.snackbar('Message', 'Data Submitted Sucessfully !',
//                   backgroundColor: Colors.black, colorText: Colors.white),
//             })
//         // ignore: invalid_return_type_for_catch_error
//         .catchError((onError) => this.setState(() {
//               this.setState(() {
//                 showloader2 = false;
//               });
//             }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
//     return Scaffold(
//       key: _scaffoldKey,
//       resizeToAvoidBottomInset: true,
//       floatingActionButton: !keyboardIsOpened
//           ? FloatingActionButton.extended(
//               elevation: 50,
//               backgroundColor: AppConstants.APP_THEME_COLOR,
//               autofocus: true,
//               onPressed: () async {
//                 // print('working1   ${_pickedFileString.runtimeType}');
//                 // return;
//                 documenturl = _pickedFileString;
//                 passportModel.photo = _pickedFileString;
//                 UserInfo userInfo = await _getter.readUserInfo();
//                 passportModel.empCode = userInfo.data.empCode;
//                 passportModel.status = true;
//                 addPassport(context);
//                 // print('working2 ${passportModel.toJson()}');
//               },
//               icon: Icon(Icons.save),
//               tooltip: 'Save',
//               label: Text('Save'),
//             )
//           : null,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         titleSpacing: 0.0,
//         title: Text(
//           "Add Passport",
//           style: TextStyle(
//               color: AppConstants.TEXT_BACKGROUND_COLOR,
//               fontSize: 18,
//               fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.black),
//         actions: [
//           GetNotificationIcon(context),
//         ],
//       ),
//       body: showloader2
//           ? showMobilityLoader(showloader2, Colors.white70)
//           : Stack(
//               children: [
//                 Container(
//                   height: 100.0.h,
//                   width: 95,
//                   margin: EdgeInsets.only(left: 15, right: 15, top: 10),
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(
//                             'Passport For',
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                       Container(
//                         width: 90,
//                         height: 40,
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         child: FormField<Passortrelation>(
//                           builder: (FormFieldState<Passortrelation> state) {
//                             return InputDecorator(
//                               decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.zero,
//                                   border: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(5.0))),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<Passortrelation>(
//                                   hint: Padding(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Text(widget.passportdata == null
//                                         ? "Select Relation"
//                                         : relationvalue),
//                                   ),
//                                   value: selectedRelation2,
//                                   isDense: true,
//                                   onChanged: (newValue) {
//                                     if (newValue.name.toLowerCase() == 'self') {
//                                       setState(() {
//                                         relationvalue =
//                                             newValue.name.toString();
//                                         selectedRelation2 = newValue;
//                                       });
//                                     } else {
//                                       setState(() {
//                                         relationvalue = newValue.id.toString();
//                                         selectedRelation2 = newValue;
//                                       });
//                                     }
//                                   },
//                                   items: relationList2 != null
//                                       ? relationList2
//                                           .map((Passortrelation value) {
//                                           return DropdownMenuItem<
//                                               Passortrelation>(
//                                             value: value,
//                                             child: Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 10),
//                                               child: Text(value.name == null
//                                                   ? ""
//                                                   : value.name),
//                                             ),
//                                           );
//                                         }).toList()
//                                       : null,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Expanded(
//                             flex: 4,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Passport Active',
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                           // FlutterSwitch(
//                           //   height: 25.0,
//                           //   width: 60.0,
//                           //   padding: 2.0,
//                           //   toggleSize: 25.0,
//                           //   borderRadius: 12.0,
//                           //   valueFontSize: 12,
//                           //   showOnOff: true,
//                           //   inactiveColor: Colors.black12,
//                           //   activeColor: AppConstants.APP_THEME_COLOR,
//                           //   value: isPassportActive,
//                           //   onToggle: (value) {
//                           //     passportactive = !passportactive;
//                           //     print(value);
//                           //     this.setState(() {
//                           //       passportModel.passportStatus =
//                           //           !passportModel.passportStatus;
//                           //       isPassportActive = !isPassportActive;
//                           //     });
//                           //   },
//                           // ),
//                           Expanded(
//                               flex: 3,
//                               child: Row(
//                                 children: [
//                                   Transform.scale(
//                                       scale: 1.5,
//                                       child: Radio(
//                                           value: 0,
//                                           groupValue: passportactive ? 0 : 1,
//                                           onChanged: (value) {
//                                             print('radio value $value');
//                                             if (value == 0) {
//                                               this.setState(() {
//                                                 passportactive = true;
//                                               });
//                                             }
//                                           },
//                                           fillColor:
//                                               WidgetStateColor.resolveWith(
//                                                   (states) => AppConstants
//                                                       .APP_THEME_COLOR))),
//                                   Text("Yes"),
//                                   Transform.scale(
//                                       scale: 1.5,
//                                       child: Radio(
//                                           value: 1,
//                                           groupValue: passportactive ? 0 : 1,
//                                           onChanged: (value) {
//                                             if (value == 1) {
//                                               this.setState(() {
//                                                 passportactive = false;
//                                               });
//                                               // visatype2 = 'Business';
//                                             }
//                                           },
//                                           fillColor:
//                                               WidgetStateColor.resolveWith(
//                                                   (states) => AppConstants
//                                                       .APP_THEME_COLOR))),
//                                   Text("No"),
//                                 ],
//                               ))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Expanded(
//                             flex: 4,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Is this a duplicate passport?',
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                           ),
//                           // FlutterSwitch(
//                           //   height: 25.0,
//                           //   width: 60.0,
//                           //   padding: 2.0,
//                           //   toggleSize: 25.0,
//                           //   borderRadius: 12.0,
//                           //   valueFontSize: 12,
//                           //   showOnOff: true,
//                           //   inactiveColor: Colors.black12,
//                           //   activeColor: AppConstants.APP_THEME_COLOR,
//                           //   value: isDuplicatePassport,
//                           //   onToggle: (value) {
//                           //     duplicatepassport = !duplicatepassport;
//                           //     print(value);
//                           //     this.setState(() {
//                           //       passportModel.duplicatePassport =
//                           //           !passportModel.duplicatePassport;
//                           //       isDuplicatePassport = !isDuplicatePassport;
//                           //     });
//                           //   },
//                           // ),
//                           Expanded(
//                               flex: 3,
//                               child: Row(
//                                 children: [
//                                   Transform.scale(
//                                       scale: 1.5,
//                                       child: Radio(
//                                           value: 0,
//                                           groupValue: duplicatepassport ? 0 : 1,
//                                           onChanged: (value) {
//                                             print('radio value $value');
//                                             if (value == 0) {
//                                               this.setState(() {
//                                                 duplicatepassport = true;
//                                               });
//                                             }
//                                           },
//                                           fillColor:
//                                               WidgetStateColor.resolveWith(
//                                                   (states) => AppConstants
//                                                       .APP_THEME_COLOR))),
//                                   Text("Yes"),
//                                   Transform.scale(
//                                       scale: 1.5,
//                                       child: Radio(
//                                           value: 1,
//                                           groupValue: duplicatepassport ? 0 : 1,
//                                           onChanged: (value) {
//                                             if (value == 1) {
//                                               this.setState(() {
//                                                 duplicatepassport = false;
//                                               });
//                                               // visatype2 = 'Business';
//                                             }
//                                           },
//                                           fillColor:
//                                               WidgetStateColor.resolveWith(
//                                                   (states) => AppConstants
//                                                       .APP_THEME_COLOR))),
//                                   Text("No"),
//                                 ],
//                               ))
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Passport Number",
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 40,
//                             child: new TextField(
//                               maxLength: 16,
//                               style: TextStyle(fontSize: 18),
//                               textAlignVertical: TextAlignVertical.center,
//                               onChanged: (text) {
//                                 passportnumber = text;
//                                 passportModel.passportNumber = text;
//                               },
//                               decoration: new InputDecoration(
//                                 hintText: widget.passportdata != null
//                                     ? passportnumber
//                                     : '',
//                                 counterText: '',
//                                 contentPadding: EdgeInsets.only(left: 10),
//                                 enabledBorder: const OutlineInputBorder(
//                                   // width: 0.0 produces a thin "hairline" border
//                                   borderSide: const BorderSide(
//                                       color: Colors.grey, width: 0.0),
//                                 ),
//                                 focusedBorder: const OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       color: Colors.grey, width: 0.0),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 20),
//                               child: Text(
//                                 "Nationality",
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: selCountry.isoCode != ''
//                                 ? Container(
//                                     padding: EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey)),
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     child:
//                                         CountryPickerUtils.getDefaultFlagImage(
//                                             selCountry))
//                                 : Container(
//                                     padding: EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey)),
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     child: Icon(Icons.flag),
//                                   ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             flex: 6,
//                             child: CustomEventWidget(
//                                 widget.passportdata != null
//                                     ? nationalityvalue
//                                     : "${selCountry.name}",
//                                 "Select Country",
//                                 Icons.arrow_drop_down_sharp,
//                                 context, onTap: () {
//                               openCustomCountryPickerDialog(context,
//                                   callback: (value) {
//                                 nationalityvalue = value.name;
//                                 this.setState(() {
//                                   selCountry = value;
//                                 });
//                                 passportModel.nationality = selCountry.name;
//                               },
//                                   list:
//                                       _Countrylist != null ? _Countrylist : "");
//                             }),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 20),
//                               child: Text(
//                                 "Country of Issue",
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.start,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: selCountryIssue.isoCode != ''
//                                 ? Container(
//                                     padding: EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey)),
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     child:
//                                         CountryPickerUtils.getDefaultFlagImage(
//                                             selCountryIssue))
//                                 : Container(
//                                     padding: EdgeInsets.all(2),
//                                     decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.grey)),
//                                     margin: EdgeInsets.only(bottom: 20),
//                                     child: Icon(Icons.flag),
//                                   ),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             flex: 6,
//                             child: CustomEventWidget(
//                                 widget.passportdata != null
//                                     ? countryvalue
//                                     : "${selCountryIssue.name}",
//                                 "Select Country",
//                                 Icons.arrow_drop_down_sharp,
//                                 context, onTap: () {
//                               openCustomCountryPickerDialog(context,
//                                   callback: (value) {
//                                 countryvalue = value.name;
//                                 this.setState(() {
//                                   selCountryIssue = value;
//                                 });
//
//                                 passportModel.countryOfIssue = selCountry.name;
//                               },
//                                   list:
//                                       _Countrylist != null ? _Countrylist : "");
//                             }),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       FittedBox(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Place of Issue",
//                               style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.black),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(
//                               width: 50,
//                             ),
//                             Container(
//                               width: 50,
//                               height: 40,
//                               child: new TextField(
//                                 maxLength: 16,
//                                 style: TextStyle(fontSize: 18),
//                                 textAlignVertical: TextAlignVertical.center,
//                                 onChanged: (text) {
//                                   issueplace = text;
//                                   passportModel.placeOfIssue = text;
//                                 },
//                                 decoration: new InputDecoration(
//                                   hintText: widget.passportdata != null
//                                       ? issueplace
//                                       : '',
//                                   counterText: '',
//                                   contentPadding: EdgeInsets.only(left: 10),
//                                   enabledBorder: const OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                         color: Colors.grey, width: 0.0),
//                                   ),
//                                   focusedBorder: const OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                         color: Colors.grey, width: 0.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Text(
//                                 "Date of Issue",
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 50,
//                             child: CustomEventWidget(
//                                 widget.passportdata != null
//                                     ? getDepartureEventFormat(issuedate)
//                                     : _dateTimeIssue == null
//                                         ? "Select Date"
//                                         : getDepartureEventFormat(
//                                             _dateTimeIssue == null
//                                                 ? DateTime.now().toString()
//                                                 : _dateTimeIssue.toString()),
//                                 "Date of Issue",
//                                 Icons.calendar_today,
//                                 context, onTap: () {
//                               selectDate(
//                                   context,
//                                   DateTime(2010),
//                                   DateTime(2100),
//                                   _dateTimeIssue == null
//                                       ? DateTime.now()
//                                       : _dateTimeIssue, datevalue: (selDate) {
//                                 passportModel.dateOfIssue = selDate;
//                                 this.setState(() {
//                                   issuedate = selDate;
//                                   _dateTimeIssue = DateTime.parse(selDate);
//                                 });
//                                 expirationdate = '';
//                                 // passportModel.passportExpiryDate = selDate;
//                                 this.setState(() {
//                                   _dateTimeExpiry = null;
//                                 });
//
//                                 // print(
//                                 //     'issuedate new string  ------- ${issuedate}');
//
//                                 // print(
//                                 //     'issuedate string  ------- ${issuedate.split('-')[0]}');
//                                 // print(
//                                 //     'issuedate2222 string  ------- ${issuedate.split('-')[2].split('T')[0]}');
//                                 // print('_dateTimeIssue string  ------- $_dateTimeIssue');
//                               });
//                             }),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             child: Padding(
//                               padding: const EdgeInsets.only(bottom: 8.0),
//                               child: Text(
//                                 "Date of Expiration",
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 50,
//                             child: CustomEventWidget(
//                                 widget.passportdata != null
//                                     ? getDepartureEventFormat(expirationdate)
//                                     : _dateTimeExpiry == null
//                                         ? "Select Date"
//                                         : getDepartureEventFormat(
//                                             _dateTimeExpiry == null
//                                                 ? DateTime.now().toString()
//                                                 : _dateTimeExpiry.toString()),
//                                 "Date of Expiration",
//                                 Icons.calendar_today,
//                                 context, onTap: () {
//                               selectDate2(
//                                   context,
//                                   issuedate == ''
//                                       ? DateTime(2010)
//                                       : DateTime(
//                                           int.parse(issuedate.split('-')[0]),
//                                           int.parse(issuedate.split('-')[1]),
//                                           int.parse(issuedate
//                                               .split('-')[2]
//                                               .split('T')[0])),
//                                   DateTime(2100),
//                                   _dateTimeExpiry == null
//                                       ? DateTime.now()
//                                       : _dateTimeExpiry, datevalue: (selDate) {
//                                 expirationdate = selDate;
//                                 passportModel.passportExpiryDate = selDate;
//                                 this.setState(() {
//                                   _dateTimeExpiry = DateTime.parse(selDate);
//                                 });
//                               });
//                             }),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 6,
//                             child: Align(
//                               alignment: Alignment.topLeft,
//                               child: Text(
//                                 "Empty pages left in the passport",
//                                 maxLines: 2,
//                                 style: TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.w400,
//                                     color: Colors.black),
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               width: 10,
//                               height: 40,
//                               child: new TextField(
//                                 maxLength: 3,
//                                 style: TextStyle(fontSize: 18),
//                                 textAlignVertical: TextAlignVertical.center,
//                                 onChanged: (text) {
//                                   emptypages = text;
//                                   passportModel.pagesPassport = text;
//                                 },
//                                 keyboardType:
//                                     const TextInputType.numberWithOptions(
//                                         signed: true, decimal: false),
//                                 inputFormatters: <TextInputFormatter>[
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 decoration: new InputDecoration(
//                                   hintText: widget.passportdata != null
//                                       ? emptypages
//                                       : '',
//                                   counterText: '',
//                                   contentPadding: EdgeInsets.only(left: 5),
//                                   enabledBorder: const OutlineInputBorder(
//                                     // width: 0.0 produces a thin "hairline" border
//                                     borderSide: const BorderSide(
//                                         color: Colors.grey, width: 0.0),
//                                   ),
//                                   focusedBorder: const OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                         color: Colors.grey, width: 0.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(flex: 2, child: Container())
//                         ],
//                       ),
//                       FittedBox(
//                         child: Container(
//                             width: 100,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 20),
//                                   child: Container(
//                                     decoration:
//                                         BoxDecoration(color: Colors.white),
//                                     child: GestureDetector(
//                                       onTap: () async {
//                                         // print('button click rahul');
//                                         // return;
//                                         showAlertDialogforFilePicker(context,
//                                             pdfpick: (path) async {
//                                           showloader = true;
//                                           final File fileForFirebase =
//                                               File(path.path);
//
//                                           this.setState(() {
//                                             _paths = path;
//                                             DocPath = _paths.path;
//
//                                             docFile = fileForFirebase;
//                                             FileuploadService(fileForFirebase);
//                                           });
//                                           String _fileName = _paths != null
//                                               ? _paths.name
//                                               : '...';
//                                           _doc_name_textcontroller.text =
//                                               _fileName;
//                                         }, imagepick: (file) async {
//                                           showloader = true;
//                                           String file_name =
//                                               file.path.split('/').last;
//                                           _doc_name_textcontroller.text =
//                                               file_name;
//
//                                           this.setState(() {
//                                             DocPath = file.path;
//
//                                             docFile = file;
//
//                                             FileuploadService(docFile);
//                                           });
//                                         });
//                                       },
//                                       child: ClayContainer(
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Center(
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.add,
//                                                   size: 25,
//                                                 ),
//                                                 Text(_doc_name_textcontroller
//                                                             .text ==
//                                                         ''
//                                                     ? "Choose File"
//                                                     : "Change File")
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 20),
//                                   child: Container(
//                                     width: 60,
//                                     child: TextField(
//                                       maxLength: 20,
//                                       style: TextStyle(fontSize: 18),
//                                       enabled: false,
//                                       controller: _doc_name_textcontroller,
//                                       decoration: new InputDecoration(
//                                           counterText: '',
//                                           contentPadding: EdgeInsets.all(5),
//                                           hintText: widget.passportdata != null
//                                               ? documenturl
//                                               : "Document Name ",
//                                           border: new OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey))),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             )),
//                       ),
//                       Container(
//                         height: 60,
//                         child: Text(""),
//                       ),
//                     ],
//                   ),
//                 ),
//                 showloader
//                     ? Container(
//                         width: 100,
//                         height: 100.0.h,
//                         color: Colors.black26,
//                         child: Center(
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             child: LiquidCircularProgressIndicator(
//                               value: _progressValue / 100,
//                               valueColor: AlwaysStoppedAnimation(
//                                   AppConstants.APP_THEME_COLOR),
//                               backgroundColor: Colors.white,
//                               borderColor: Colors.red,
//                               borderWidth: 1.0,
//                               direction: Axis.vertical,
//                               center: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     '$_progressValue%\n Uploading Document',
//                                     style: TextStyle(
//                                         fontSize: 12.0,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.yellow),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     : SizedBox(),
//               ],
//             ),
//     );
//   }
//
//   FileuploadService(_pickedFile) {
//     print('button click rahul');
//     _fileUpload
//         .uploadFile(_pickedFile, '${AppConstants.BASE_URL}/uploadDoc/', _tasks,
//             onstart: (taskid, tag) {
//       this.setState(() {
//         _tasks.putIfAbsent(
//             tag,
//             () => UploadItem(
//                   id: taskid,
//                   tag: tag,
//                   status: UploadTaskStatus.enqueued,
//                 ));
//       });
//     });
//   }
// }
