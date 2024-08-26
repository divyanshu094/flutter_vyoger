import 'package:flutter/material.dart';

CustomMenuTitle(String image,String text,BuildContext context,
    {required VoidCallback OnTouch}) {

  return
    ListTile(
      contentPadding:
      new EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
      leading:
      Image.asset(image, fit: BoxFit.contain,height: 25,width: 25,),
      title: Text(text),
      onTap: () => {

        OnTouch()
      },
    );
}
