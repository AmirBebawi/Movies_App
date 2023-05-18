import 'package:flutter/material.dart';

class MyTheme {
  static const Color black = Color(0xff121312);
  static const Color white = Color(0xffFFFFFF);
  static const Color orange = Color(0xffF7B539);
  static const Color yellow = Color(0xffFFBB3B);
  static const Color Fontgray = Color(0xff514F4F);
  static const Color gray = Color(0xff282A28);
  static const Color colorBar = Color(0xff1A1A1A);
  static const Color iconcolorBar = Color(0xffC6C6C6);
  static ThemeData DarkMode = ThemeData(
      backgroundColor: black,
      textTheme: const TextTheme(
        bodyLarge:
            TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
            fontSize: 10, color: Fontgray, fontWeight: FontWeight.w600),
      ));
}
