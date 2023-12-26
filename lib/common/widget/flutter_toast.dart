import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

toastInfo({
  required String message,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: backgroundColor,
    textColor: textColor
  );
}
