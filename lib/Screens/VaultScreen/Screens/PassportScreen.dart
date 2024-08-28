import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/PassportModel.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Screens/VaultScreen/Screens/AddNewPassport.dart';
import 'package:mobility_sqr/Util/UtilClass.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';

class PassportScreen extends StatefulWidget {
  // List<PassportDetail> passportDetaillist;

  // PassportScreen(this.passportDetaillist);

  @override
  _PassportScreenState createState() => _PassportScreenState();
}

class _PassportScreenState extends State<PassportScreen> {
  ApiProvider _apiProvider = ApiProvider();
  List<PassportDetail>? passportDetaillist;
  TokenGetter userInfo = TokenGetter();
  String empcode = "";
  bool showloader = true;
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    UserInfo _userinfo = await userInfo.readUserInfo() ?? null;
    empcode = _userinfo.data.empCode;
    getPassport(empcode);
    // getVisa(empcode);
  }

  getPassport(String empcode) async {
    await _apiProvider
        .get_employee_passport(empCode: empcode)
        .then((value) => {
              this.setState(() {
                passportDetaillist = value.data;
                showloader = false;
              }),
              print('new passport data ${value.toJson()}')
            })
        .catchError((onError) => this.setState(() {
              this.setState(() {
                showloader = false;
              });
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 50,
        backgroundColor: AppConstants.APP_THEME_COLOR,
        autofocus: true,
        onPressed: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddNewPassport()),
          // );
          // final result = await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => AddNewPassport(empcode, null)),
          // );
          // print('page return response ---- ${result}');
          // if (result != null && result == true) {
          //   getPassport(empcode);
          // }
        },
        icon: Icon(Icons.add),
        tooltip: 'Add New',
        label: Text('Add New'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Passport",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          SizedBox(
            width: 40,
          ),
          GetNotificationIcon(context),
        ],
      ),
      body: Container(
        color: Colors.white,
        // height: 100.0.h,
        child: showloader
            ? showMobilityLoader(showloader, Colors.white70)
            : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 50,
                    child: passportDetaillist == null
                        ? Center(
                            child: Text("No Data Found"),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) =>
                                _renderContainer("key$index", index),
                            itemCount: passportDetaillist!.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true),
                  )
                ],
              ),
      ),
    );
  }

  Widget _renderContainer(mykey, int index) {
    mykey = GlobalKey<SimpleFoldingCellState>();
    return Container(
      color: Colors.transparent,
      child: SimpleFoldingCell.create(
        key: mykey,
        frontWidget: _buildFrontWidget(mykey, passportDetaillist!, index),
        innerWidget: _buildInnerWidget(mykey, passportDetaillist!, index),
        cellSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height / 4),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('View'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget(
      mykey, List<PassportDetail> passportDetaillist, int index) {
    return GestureDetector(
      onTap: () {
        mykey?.currentState?.toggleFold();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF9a4c92),
                const Color(0xFFbf7192),
                const Color(0xFF8c3771),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0, 2.0],
              tileMode: TileMode.clamp),
        ),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${passportDetaillist[index].empCode}",
                        style: _textStyle,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.deepPurpleAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: AutoSizeText(
                              "${passportDetaillist[index].countryOfIssue.toUpperCase()}",
                              maxFontSize: 12,
                              minFontSize: 6,
                              style: _textStyle,
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/passport_white.png",
                        scale: .8,
                      ),
                      column_widget(passportDetaillist[index]),
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "View Passport",
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ],
                    ))
              ],
            ),
            // Positioned(
            //   right: 5,
            //   top: 30,
            //   child: InkWell(
            //     onTap: () async {
            //       // print(
            //       //     'fdgsgdsgdfsgdsgdgfsdgsdgsdgdsgs ${passportDetaillist[index]}');
            //       // print('new edit functionality ${cardDetail.toJson()}');
            //       // Navigator.pushNamed(context, '/AddEmergencyContact',
            //       //     arguments: cardDetail);

            //       final result = await Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 AddNewPassport(empcode, passportDetaillist[index])),
            //       );
            //       print('page return response ---- ${result}');
            //       if (result != null && result == true) {
            //         getPassport(empcode);
            //       }
            //     },
            //     child: Container(
            //       margin: EdgeInsets.only(right: 10),
            //       child: Icon(
            //         Icons.edit,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  column_widget(PassportDetail passportDetaillist) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Number",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          "${passportDetaillist.passportNumber}",
          style: _textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Valid Through",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500),
        ),
        Text(
          passportDetaillist.dateOfExpiration != ""
              ? "${getPassportimeformat(passportDetaillist.dateOfExpiration)}"
              : 'N/A',
          style: _textStyle,
        )
      ],
    );
  }

// onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
  Widget _buildInnerWidget(
      mykey, List<PassportDetail> passportDetaillist, int index) {
    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: passportDetaillist[index].photo == ''
                ? Container()
                : passportDetaillist[index].photo != null
                    ? Image.network(
                        '${passportDetaillist[index].photo}')
                    : Text("No Document Uploaded"),
          ),
          Positioned(
            top: 0,
            right: 5,
            child: GestureDetector(
              onTap: () {
                mykey?.currentState?.toggleFold();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurpleAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Close",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle =
      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
}
