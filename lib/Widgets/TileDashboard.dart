import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';
import 'package:mobility_sqr/ModelClasses/DragDropModel.dart';

import 'package:sizer/sizer.dart';

class TileDashboard extends StatelessWidget {
  final Function(int) onTap;
  final DragDropModel model;

  TileDashboard(@required this.model, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(model.where);
      },
      child: Container(
        color: Colors.transparent,
        height: 180,
        width: 180,
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 180,
              child: Image.asset(
                model.image,
                fit: BoxFit.contain,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  model.first_text,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.TEXT_BACKGROUND_COLOR,
                  ),
                  textAlign: TextAlign.start,
                )),
            Container(
                margin: EdgeInsets.only(top: 60, left: 10),
                child: Text(
                  model.second_text,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.TEXT_BACKGROUND_COLOR),
                  textAlign: TextAlign.start,
                ))
          ],
        ),
      ),
    );
  }
}
