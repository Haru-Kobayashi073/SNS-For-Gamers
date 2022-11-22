import 'package:flutter/material.dart';

ThemeData lightThemeData({required BuildContext context}) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white
  );

}

ThemeData darkThemeData({required BuildContext context}) {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.black
    );

}
