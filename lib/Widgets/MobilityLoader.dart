import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

showMobilityLoader(bool show, Color colorBG) {
  return show
      ? Container(
          // height: 100,
          // width: 100,
          color: colorBG,
          child: Center(
            child: LoadingBouncingGrid.circle(
              size: 50,
              backgroundColor: AppConstants.APP_THEME_COLOR,
            ),
          ),
        )
      : SizedBox();
}
