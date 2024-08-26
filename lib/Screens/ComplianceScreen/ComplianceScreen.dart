import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/ComplianceModel.dart';
import 'package:mobility_sqr/ModelClasses/ComplianceResponse.dart';
import 'package:mobility_sqr/ModelClasses/SubmitResponseQuestions.dart';
import 'package:mobility_sqr/ModelClasses/UserInfo.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';

class ComplianceScreen extends StatefulWidget {
  @override
  _ComplianceScreenState createState() => _ComplianceScreenState();
}

class _ComplianceScreenState extends State<ComplianceScreen> {
  ApiProvider _apiProvider = ApiProvider();
  final _userInfo = TokenGetter();
  bool isSubmitted = false;

  String empcode = '';

  List<ComplianceData> complianceQuestions = [];

  getBoolquestion(bool value) {
    if (value) {
      return 0;
    } else {
      return 1;
    }
  }

  getEmpCode() async {
    try {
      UserInfo info = await _userInfo.readUserInfo() ?? null;
      empcode = info.data.empCode;

      await _apiProvider
          .checktheQuestions(empcode)
          .then((ComplianceModel value) => {
                if (value.data.length > 0)
                  {
                    this.setState(() {
                      complianceQuestions = value.data;
                    }),
                  }
                else
                  {}
              });
        } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getEmpCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Onsite Compliance",
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
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 75,
              right: 0,
              left: 0,
              top: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Onsite Compliance Questions  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: complianceQuestions.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              QuestionCard(
                                isSubmitted: isSubmitted,
                                question: complianceQuestions[index].complQues,
                                value: getBoolquestion(
                                    complianceQuestions[index].complAns),
                                onchange: (value) {
                                  this.setState(() {
                                    bool j;
                                    if (value == 0) {
                                      j = true;
                                    } else {
                                      j = false;
                                    }
                                    complianceQuestions[index].complAns = j;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]);
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  // color:
                  //     isSubmitted ? Colors.grey : AppConstants.APP_THEME_COLOR,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     side: BorderSide(
                  //         color: isSubmitted
                  //             ? Colors.grey
                  //             : AppConstants.APP_THEME_COLOR)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    List<ComplianceQuestion> postAnswers = [];

                    for (int i = 0; i < complianceQuestions.length; i++) {
                      postAnswers.add(ComplianceQuestion(
                          complAns: complianceQuestions[i].complAns,
                          complQues: complianceQuestions[i].complQues,
                          empCode: empcode));
                    }
                    _apiProvider
                        .submitComplianceQuestions(postAnswers)
                        .then((SubmitResponseQuestions value) => {
                              Get.snackbar('Info', '${value.message}',
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.black),
                            });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard(
      {required this.question, required this.value, required this.onchange, required this.isSubmitted});

  final String question;
  final int value;
  final Function(int) onchange;
  final bool isSubmitted;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: isSubmitted ? Colors.grey : Color(0xffe8e1f3),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Text(
                question,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Transform.scale(
                      scale: 1.5,
                      child: Radio(
                          value: 0,
                          groupValue: value,
                          onChanged: (value) {
                            if (!isSubmitted) {
                              onchange(value!);
                            }
                          },
                          fillColor: WidgetStateColor.resolveWith(
                              (states) => AppConstants.APP_THEME_COLOR))),
                  Text("Yes"),
                  SizedBox(
                    width: Get.width / 6,
                  ),
                  Transform.scale(
                      scale: 1.5,
                      child: Radio(
                          value: 1,
                          groupValue: value,
                          onChanged: (value) {
                            if (!isSubmitted) {
                              onchange(value!);
                            }
                          },
                          fillColor: WidgetStateColor.resolveWith(
                              (states) => AppConstants.APP_THEME_COLOR))),
                  Text("No"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
