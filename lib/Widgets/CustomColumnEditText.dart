import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobility_sqr/Constants/AppConstants.dart';

class CustomColumnEditText extends StatefulWidget {
  VoidCallback onTap;
  String placename, countryname, hint, header;
  int Type;
  bool hide = false;

  CustomColumnEditText(this.hint, this.placename, this.countryname, this.header,
      this.Type, this.hide,
      {required this.onTap});

  @override
  _CustomColumnEditTextState createState() => _CustomColumnEditTextState();
}

class _CustomColumnEditTextState extends State<CustomColumnEditText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Column(
        children: [
          Container(
            width: 200,
            child: Text(
              widget.header,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppConstants.TEXT_BACKGROUND_COLOR,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
              width: 200,
              height: 30,
              child: widget.placename == ''
                  ? TextFormField(
                      initialValue: widget.placename,
                      enabled: false,
                      textAlignVertical: TextAlignVertical.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      autofocus: false,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 12),
                        hintText: widget.hint,
                        suffixIcon: widget.Type == 1
                            ? Icon(
                                Icons.search,
                                color: AppConstants.APP_THEME_COLOR,
                              )
                            : Icon(
                                Icons.calendar_today,
                                color: AppConstants.APP_THEME_COLOR,
                              ),
                        border: widget.placename == ''
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppConstants.TEXT_BACKGROUND_COLOR))
                            : InputBorder.none,
                      ),
                      onTap: () {
                        widget.onTap();
                      },
                    )
                  : Container(
                      width: 100,
                      height: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: AutoSizeText(
                                widget.placename,
                                minFontSize: 12,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            widget.hide
                                ? SizedBox(
                                    width: 0,
                                    height: 0,
                                  )
                                : Expanded(
                                    flex: 1,
                                    child: widget.Type == 1
                                        ? Icon(
                                            Icons.search,
                                            color: AppConstants.APP_THEME_COLOR,
                                          )
                                        : Icon(
                                            Icons.calendar_today,
                                            color: AppConstants.APP_THEME_COLOR,
                                          ),
                                  ),
                          ],
                        ),
                      ),
                    )),
          Container(
              width: MediaQuery.sizeOf(context).width,
              child: Text(
                widget.countryname,
                style: TextStyle(
                  fontSize: 15,
                  color: AppConstants.TEXT_BACKGROUND_COLOR,
                ),
                textAlign: TextAlign.start,
              )),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
