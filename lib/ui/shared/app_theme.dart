import 'package:flutter/material.dart';

class HYAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 30;

  // 2.普通模式
  static const Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
      floatingActionButtonTheme:FloatingActionButtonThemeData(backgroundColor:Colors.orange),
      primarySwatch: Colors.pink,
      hintColor: Colors.amber,
      canvasColor: const Color.fromRGBO(255, 254, 222, 1),
      //背景颜色
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: bodyFontSize),
        headlineMedium:
            TextStyle(fontSize: smallFontSize, color: Colors.black87),
        displaySmall:
            TextStyle(fontSize: normalFontSize, color: Colors.black87),
        displayMedium:
            TextStyle(fontSize: largeFontSize, color: Colors.black87),
        displayLarge: TextStyle(
            fontSize: xlargeFontSize,
            color: Colors.black87,
            fontWeight: FontWeight.w400),
      ));

  // 3.暗黑模式
  static const Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: const TextTheme(
          bodyLarge:
              TextStyle(fontSize: normalFontSize, color: darkTextColors)));
}
