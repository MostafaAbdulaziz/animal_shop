import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage({
  required String message,
  required Color backgroundColor,
  required Color textColor,
}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0
  );
}