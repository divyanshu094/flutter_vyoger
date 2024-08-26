import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/ApiCall/Repository.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/Approval.dart';
import 'package:mobility_sqr/ModelClasses/BulkApprovalJsonModel.dart';
import 'package:mobility_sqr/ModelClasses/GetTravelRequest.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/Approvals/bloc/aprrovals_bloc.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:sizer/sizer.dart';

class ApprovalsScreen extends StatefulWidget {
  @override
  _ApprovalsScreenState createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  late AprrovalsBloc _aprrovalsBloc;

  var checkedValue = false;
  final Repository repository = Repository();

  late BuildContext dialogContext;
  var headertext = "Previous Travels";
  var args;
  final GlobalKey loaderkey = GlobalKey<NavigatorState>();
  ApiProvider _appApiProvider = ApiProvider();
  var where;
  bool showloader = false;
  List<ApprovalReq> _mylist = [];
  final _userData = TokenGetter();
  String empCode = '';
  String orgId = '';

  String rejectReason = '';

  @override
  void initState() {
    super.initState();

    _aprrovalsBloc = AprrovalsBloc(repository);

    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments;
      });
      try {
        where = args['where'];
      } catch (e) {}

      headertext = args['header'];
    });
  }

  getInfo() async {
    UserInfo info = await _userData.readUserInfo() ?? null;
    empCode = info.data.empCode;
    orgId = info.data.orgId;
  }

  @override
  Widget build(BuildContext context) {
    getInfo();
    args = ModalRoute.of(context)?.settings.arguments;
    final navi = args["where"];

    return WillPopScope(
      onWillPop: null, //_onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                // _onWillPop();
              }),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 10,
          title: Text("$headertext",
              style: TextStyle(color: Colors.black, fontSize: 17.0)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: BlocProvider(
                create: (context) => _aprrovalsBloc,
                child: Column(
                  children: [
                    Expanded(
                      flex: 15,
                      child: BlocBuilder<AprrovalsBloc, AprrovalsState>(
                          builder: (context, state) {
                        // print('data of state approval ${state}');
                        if (state is AprrovalsInitial) {
                          print('data of state approval');
                          if (navi == 2) {
                            BlocProvider.of<AprrovalsBloc>(context)
                                .add(Fetch_previous_req());
                          } else {
                            BlocProvider.of<AprrovalsBloc>(context)
                                .add(Fetch_travel_req_approver());
                          }
                        }
                        if (state is AprrovalsLoading) {}
                        if (state is AprrovalsError) {
                          return Center(
                            child: Text('Oops Something Went Wrong!'),
                          );
                        }
                        if (state is AprrovalsLoaded) {
                          // print(
                          //     'data of state approval ${state.approvalModal.data.length}');
                          //      print(
                          //     'data of state approval ${_aprrovalsBloc}');
                          return state.approvalModal.data.length == 0
                              ? Center(
                                  child: Text('No Any Approvals.'),
                                )
                              : AnimationLimiter(
                                  child: ListView.builder(
                                      shrinkWrap: false,
                                      itemCount:
                                          state.approvalModal.data.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration:
                                              const Duration(milliseconds: 375),
                                          child: SlideAnimation(
                                            horizontalOffset: 50.0,
                                            child: FadeInAnimation(
                                              child: GestureDetector(
                                                onTap: () {
                                                  this.setState(() {
                                                    showloader = true;
                                                  });
                                                  _appApiProvider
                                                      .fetchViewTravelReq(state
                                                          .approvalModal
                                                          .data[index]
                                                          .travelReqId)
                                                      .then((value) =>
                                                          this.setState(() {
                                                            showloader = false;
                                                            NavigationHandler(
                                                                value,
                                                                context,
                                                                where);
                                                          }))
                                                      .catchError((onError) =>
                                                          this.setState(() {
                                                            showloader = false;
                                                          }));
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Cell(
                                                    state.approvalModal
                                                        .data[index],
                                                    where,
                                                    onSelected: (selectedrow) {
                                                      if (_mylist.length == 0) {
                                                        _mylist
                                                            .add(selectedrow);
                                                      } else {
                                                        bool isFound = false;
                                                        for (int i = 0;
                                                            i < _mylist.length;
                                                            i++) {
                                                          if (_mylist[i].id ==
                                                              selectedrow.id) {
                                                            isFound = true;
                                                            break;
                                                          }
                                                        }
                                                        if (isFound) {
                                                          _mylist.remove(
                                                              selectedrow);
                                                        } else {
                                                          _mylist
                                                              .add(selectedrow);
                                                        }
                                                      }

                                                      setState(() {
                                                        _mylist = _mylist;
                                                      });
                                                    },
                                                    changeValue: (bool) {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                        }

                        return Container(
                          height: 100.0.h,
                          width: 100.0.w,
                          color: Colors.transparent,
                          child: Center(
                            child: LoadingBouncingGrid.circle(
                              size: 50,
                              backgroundColor: AppConstants.APP_THEME_COLOR,
                            ),
                          ),
                        );
                      }),
                    ),
                    navi == 5 && _mylist.length != 0
                        ? Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 5.0.h,
                                  child: TextButton(
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    // textColor: Colors.white,
                                    // color: Colors.red[600],
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    onPressed: () {
                                      List<BulkApprovalJson> data = [];

                                      showDialog(context, onReject: () {
                                        _mylist.forEach((element) {
                                          BulkApprovalJson model =
                                              BulkApprovalJson(
                                                  approvalLevel:
                                                      element.approvalLevel,
                                                  approveAction: 'R',
                                                  currentTicketOwner: empCode,
                                                  modifiedBy: empCode,
                                                  module: 'Travel',
                                                  orgId: orgId,
                                                  requestNotes: rejectReason,
                                                  takeOwnership: '',
                                                  transferTo: '',
                                                  travelReqId:
                                                      element.travelReqId);
                                          data.add(model);
                                        });

                                        if (_mylist.length != 0) {
                                          if (rejectReason == '') {
                                            Get.snackbar('Info',
                                                "Please enter the reason for Reject",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                colorText: Colors.white,
                                                backgroundColor: Colors.black);
                                          } else {
                                            Navigator.pop(context);
                                            this.setState(() {
                                              showloader = true;
                                            });
                                            _appApiProvider
                                                .submitBulkApproval(data)
                                                .then((value) => {
                                                      if (value)
                                                        {
                                                          rejectReason = '',
                                                          _mylist.clear(),
                                                          this.setState(() {
                                                            showloader = false;
                                                          }),
                                                          Get.snackbar('Info',
                                                              "Reject Successfully",
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              colorText:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors.black),
                                                          _aprrovalsBloc.add(
                                                              Fetch_travel_req_approver())
                                                        }
                                                      else
                                                        {
                                                          rejectReason = '',
                                                          Get.snackbar('Info',
                                                              'Failed to Reject',
                                                              snackPosition:
                                                                  SnackPosition
                                                                      .BOTTOM,
                                                              colorText:
                                                                  Colors.white,
                                                              backgroundColor:
                                                                  Colors.black),
                                                        }
                                                    });
                                          }
                                        } else {
                                          Get.snackbar(
                                              'Info', "No Entry Selected",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor: Colors.black);
                                        }
                                      }, ontextchange: (text) {
                                        rejectReason = text;
                                        print(text);
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  height: 5.0.h,
                                  child: TextButton(
                                    child: Text(
                                      'Approve',
                                      style: TextStyle(fontSize: 20.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    // textColor: Colors.white,
                                    // color: Colors.green,
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.circular(10),
                                    // ),
                                    onPressed: () {
                                      List<BulkApprovalJson> data = [];

                                      _mylist.forEach((element) {
                                        BulkApprovalJson model =
                                            BulkApprovalJson(
                                                approvalLevel:
                                                    element.approvalLevel,
                                                approveAction: 'A',
                                                currentTicketOwner: empCode,
                                                modifiedBy: empCode,
                                                module: 'Travel',
                                                orgId: orgId,
                                                requestNotes: '',
                                                takeOwnership: '',
                                                transferTo: '',
                                                travelReqId:
                                                    element.travelReqId);
                                        data.add(model);
                                      });

                                      if (_mylist.length != 0) {
                                        this.setState(() {
                                          showloader = true;
                                        });
                                        _appApiProvider
                                            .submitBulkApproval(data)
                                            .then((value) => {
                                                  if (value)
                                                    {
                                                      _mylist.clear(),
                                                      this.setState(() {
                                                        showloader = false;
                                                      }),
                                                      Get.snackbar('Info',
                                                          "Approve Successfully",
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          colorText:
                                                              Colors.white,
                                                          backgroundColor:
                                                              Colors.black),
                                                      _aprrovalsBloc.add(
                                                          Fetch_travel_req_approver())
                                                    }
                                                  else
                                                    {
                                                      Get.snackbar('Info',
                                                          'Failed to Approve',
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          colorText:
                                                              Colors.white,
                                                          backgroundColor:
                                                              Colors.black),
                                                    }
                                                });
                                      } else {
                                        Get.snackbar(
                                            'Info', "No Entry Selected",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.black);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
            showMobilityLoader(showloader, Colors.transparent)
          ],
        ),
      ),
    );
  }

  // Future<bool> _onWillPop() {
  //   Navigator.of(context)
  //       .pushNamedAndRemoveUntil('/Dashboard', (Route<dynamic> route) => false);
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

NavigationHandler(GetTravelRequest value, BuildContext context, where) {
  Navigator.pushNamed(context, '/TravelReqView',
      arguments: {"EmployeeData": value.data, "where": where});
}

class Cell extends StatefulWidget {
  ApprovalReq fact;
  Function(bool) changeValue;
  int where;
  Function(ApprovalReq) onSelected;

  Cell(this.fact, this.where,
      {required this.changeValue, required this.onSelected});

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  late bool myvalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    TextWidget("Employee Name", 13.0, FontWeight.w100,
                        Colors.black54, 2.0),
                    TextWidget(widget.fact.firstName + widget.fact.lastName,
                        15.0, FontWeight.w700, null, 7.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              TextWidget("From Date", 13.0, FontWeight.w100,
                                  Colors.black54, 4.0),
                              TextWidget(
                                  getDepartureDate(
                                      widget.fact.details.length > 0
                                          ? widget.fact.details[0].departureDate
                                          : " "),
                                  13.0,
                                  FontWeight.w600,
                                  null,
                                  0),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              TextWidget("To Date", 13.0, FontWeight.w100,
                                  Colors.black54, 4.0),
                              TextWidget(
                                  getDepartureDate(widget.fact.details.length >
                                          0
                                      ? widget
                                          .fact
                                          .details[
                                              widget.fact.details.length - 1]
                                          .returnDate
                                      : " "),
                                  13.0,
                                  FontWeight.w600,
                                  null,
                                  0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Column(
                    children: [
                      TextWidget("Travel Request ID", 13.0, FontWeight.w100,
                          Colors.black54, 2.0),
                      TextWidget(widget.fact.travelReqId, 16.0, FontWeight.w700,
                          AppConstants.APP_THEME_COLOR, 7.0),
                      TextWidget("Employee ID", 13.0, FontWeight.w100,
                          Colors.black54, 2.0),
                      TextWidget(widget.fact.empCode, 15.0, FontWeight.w600,
                          Colors.black, 0),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: widget.where == 5
                    ? Checkbox(
                        checkColor: Colors.white,
                        activeColor: AppConstants.APP_THEME_COLOR,
                        value: widget.fact.isSelected,
                        onChanged: (bool? value) {
                          widget.onSelected(widget.fact);
                          this.setState(() {
                            widget.fact.isSelected = !widget.fact.isSelected;
                          });
                          // widget.changeValue(value);
                        },
                      )
                    : SizedBox(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 1,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  TextWidget(this.value, this.fontSize, this.fontWeight, this.fontColor,
      this.paddingBottom);

  final String value;
  final double fontSize;
  final FontWeight fontWeight;
  final dynamic fontColor;
  final double paddingBottom;

  //final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, paddingBottom),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          value,
          style: TextStyle(
              fontSize: fontSize, color: fontColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

getDepartureDate(String date) {
  print(date);
  if (date == "") {
    return "";
  } else {
    try {
      var depatureDate = DateTime.parse(date.toString()).toLocal();
      final String datestring = DateFormat("dd/MMM/yyyy").format(depatureDate);
      return datestring;
    } catch (e) {
      return " ";
    }
  }
}

void showDialog(BuildContext context,
    {required ValueChanged ontextchange, required VoidCallback onReject}) {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 300,
          child: SizedBox.expand(
              child: Material(
            borderRadius: BorderRadius.circular(40),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reason",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  TextField(
                    maxLines: 5,
                    onChanged: (text) {
                      ontextchange(text);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Reason for Reject',
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onReject();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Reject',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // textColor: Colors.white,
                    // color: Colors.red,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                  )
                ],
              ),
            ),
          )),
          margin: EdgeInsets.only(top: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}
