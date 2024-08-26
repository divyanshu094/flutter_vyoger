import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/Screens/LoginScreen/Username_screen.dart';
import 'package:mobility_sqr/Screens/LoginScreen/bloc/UsernameBloc.dart';
import 'package:mobility_sqr/Widgets/EditFieldUsername.dart';

class ForgetPasswordViaMail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ForgetPassMail();
}

class _ForgetPassMail extends State<ForgetPasswordViaMail> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc.flushConfirmController();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(//return LayoutBuilder
        builder: (context, constraints) {
      return OrientationBuilder(//return OrientationBuilder
          builder: (context, orientation) {
        //initialize SizerUtil()
        //     Device.orientation == Orientation.portrait
        //         ? Container(   // Widget for Portrait
        //       width: 100,
        //       height: 20.5.h,
        //     )
        //         : Container(   // Widget for Landscape
        //       width: 100,
        //       height: 12.5.h,
        //     );
        // SizerUtil()
        //     .init(constraints, Orientation.portrait); //initialize SizerUtil
        return Scaffold(
          body: Builder(
            builder: (ctx) => Container(
              // width: 100,
              color: Colors.white,
              child: Column(
                verticalDirection: VerticalDirection.down,
                children: [
                  Container(
                    child: Image.asset('assets/images/login_header.png'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: Text("Forget Password",
                        style: Loign_UI_Constants.styleForText),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 10, 20, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Please Sign in to access your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: EditFieldCustom(Icons.perm_identity, "Email ID*",
                        'Enter Registered Email', 3),
                  ),
                  Container(
                    // width: 100,
                    margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                    // decoration: BoxDecoration(
                    //     color: AppConstants.APP_THEME_COLOR,
                    //     borderRadius: BorderRadius.circular(10.0)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.APP_THEME_COLOR,
                        ),
                        // elevation: 0,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(10.0),
                        // ),
                        // color: AppConstants.APP_THEME_COLOR,
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          FocusScope.of(ctx).unfocus();

                          String msg = await bloc.sendResetEmail();
                          Get.snackbar('Error', '$msg',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.black,
                              colorText: Colors.white);
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      // width: 100,
                      margin: EdgeInsets.fromLTRB(0, 30, 20, 30),
                      child: Text(
                        "Back to Sign in",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppConstants.APP_THEME_COLOR,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
