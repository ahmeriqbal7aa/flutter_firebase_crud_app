import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String labelText, Icon iconType) {
  return InputDecoration(
    fillColor: Colors.grey.withOpacity(0.1),
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    ),
    prefixIcon: iconType,
    labelText: labelText,
    labelStyle: TextStyle(fontSize: 16.0),
  );
}

TextStyle simpleTextStyle() {
  return TextStyle(fontSize: 17.0);
}

RoundedRectangleBorder raisedButtonBorder() {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0));
}
