import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobility_sqr/ApiCall/ApiProvider.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/LocalStorage/SharedPrefencs.dart';
import 'package:mobility_sqr/ModelClasses/CountryListModel.dart';
import 'package:mobility_sqr/ModelClasses/EmergencyContactModel.dart';
import 'package:mobility_sqr/ModelClasses/GenderModel.dart';
import 'package:mobility_sqr/ModelClasses/RelationList.dart';
import 'package:mobility_sqr/Screens/EmergencyContact/AddEmergencyContact.dart';
import 'package:mobility_sqr/Widgets/MobilityLoader.dart';
import 'package:mobility_sqr/Widgets/NotificationWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class EmergencyContact extends StatefulWidget {
  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  ApiProvider _apiProvider = ApiProvider();

  List<Datae> _list = [];

  List<Widget> cards = [];

  bool loaderBool = true;
  List<Relation> relationList = [];
  TokenGetter _getter = TokenGetter();
  late Gender _genderlist; // = Gender();
  late CountryListModel _countrylist; //= CountryListModel();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getemergency();
    getRelationList();
    getCountrylist();
  }

  getCountrylist() {
    _apiProvider
        .getCountrylist(countryId: '')
        .then((value) => this.setState(() {
              _countrylist = value;
            }))
        .onError((error, stackTrace) => this.setState(() {
              // showhideloader = false;
            }));
  }

  getRelationList() async {
    RelationList data = await _getter.readRelationList();
    this.setState(() {
      relationList.addAll(data.data);
    });
    getGenderlist();
  }

  getGenderlist() {
    _apiProvider
        .getGenderlist()
        .then((value) => {
              this.setState(() {
                _genderlist = value;
                // showhideloader = false;
              }),
              getemergency()
            })
        .onError((error, stackTrace) => {
              this.setState(() {
                // showhideloader = false;
              })
            });
  }

  getemergency() {
    this.setState(() {
      cards = [];
      // loaderBool = false;
    });
    _apiProvider
        .getEmergencyContact()
        .then((value) => this.setState(() {
              _list = value.data;

              for (int i = 0; i < _list.length; i++) {
                for (int j = 0; j < _genderlist.data.length; j++) {
                  if (_genderlist.data[j].code == _list[i].gender) {
                    _list[i].gender = _genderlist.data[j].description;
                    break;
                  }
                }
                for (int l = 0; l < _countrylist.data.length; l++) {
                  if (_countrylist.data[l].countryId == _list[i].country) {
                    _list[i].country = _countrylist.data[l].name;
                    break;
                  }
                }
                for (int k = 0; k < relationList.length; k++) {
                  if ('self' == _list[i].relationship.toLowerCase()) {
                    _list[i].relationship = 'Self';
                    break;
                  } else if (relationList[k].id.toString() ==
                      _list[i].relationship) {
                    _list[i].relationship = relationList[k].description;
                    break;
                  }
                }

                cards.add(Card(_list[i], i));
              }
              this.setState(() {
                loaderBool = false;
                cards = cards;
              });
            }))
        .onError((error, stackTrace) => this.setState(() {
              loaderBool = false;
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
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEmergencyContact()),
          );
          print('page return response ---- ${result}');
          if (result != null && result == true) {
            getemergency();
          }
          // Navigator.pushNamed(context, '/AddEmergencyContact', arguments: null);
        },
        icon: Icon(Icons.add),
        tooltip: 'Add Contact',
        label: Text('Add Contact'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        titleSpacing: 0.0,
        title: Text(
          "Emergency Contact",
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
      body: Stack(
        children: [
          Container(
            child: cards.isNotEmpty
                ? StackedCardCarousel(
                    initialOffset: 40,
                    spaceBetweenItems: 400,
                    items: cards,
                  )
                : SizedBox(
                    child: !loaderBool
                        ? Center(child: Text("No Record Found"))
                        : SizedBox(),
                  ),
          ),
          Container(
            height: 100.0.h,
            width: 100.0,
            child: showMobilityLoader(loaderBool, Colors.black12),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  Datae cardDetail;
  int index;

  Card(@required this.cardDetail, @required this.index);

  final rnd = math.Random();
  List<Color?> colors = [
    Colors.purple[200],
    Colors.blueAccent.shade200,
    Colors.deepPurple,
    Colors.indigo
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      // height: 45.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(color: Colors.white),
        color: colors[rnd.nextInt(colors.length)],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _customtab(header: 'Name', value: cardDetail.name),
              _customtab(header: 'Relation', value: cardDetail.relationship),
              _customtab(
                  header: 'Phone',
                  value: cardDetail.countryCode + cardDetail.phone),
              _customtab(header: 'Gender', value: cardDetail.gender),
              _customtab(header: 'Email', value: cardDetail.email),
              _customtab(header: 'Address', value: cardDetail.address1),
              _customtab(
                  header: 'Dependent',
                  value: cardDetail.isDependent ? 'Yes' : 'No'),
              _customtab(
                  header: 'Location',
                  value:
                      '${cardDetail.country}, ${cardDetail.state}, ${cardDetail.city}'),
              _customtab(header: 'Zip Code', value: cardDetail.zip),
            ],
          ),
          // Positioned(
          //   right: 5,
          //   top: 15,
          //   child: InkWell(
          //     onTap: () {
          //       // print('new edit functionality ${cardDetail.toJson()}');
          //       Navigator.pushNamed(context, '/AddEmergencyContact',
          //           arguments: cardDetail);
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
    );
  }
}

_customtab({required String header, required String value}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
              child: Text(
                header,
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              width: 5,
              child: Text(
                '-',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
                width: 50,
                child: Text(
                  '${value}',
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                )),
          ]),
    ),
  );
}
