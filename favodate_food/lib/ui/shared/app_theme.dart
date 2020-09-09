import 'package:flutter/material.dart';

class AppTheme {

  /// 1.公有属性
  static const double bodyFontSize = 16;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xlargeFontSize = 28;

  /// 2.普通模式
  static final Color normalTextColor = Colors.red;

  static final ThemeData normalTheme = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: bodyFontSize, color: Colors.black87),
      display1: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      display2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      display3: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      display4: TextStyle(fontSize: xlargeFontSize, color: Colors.black87),
    ),
  );

  /// 3.暗黑模式
  static final Color darkTextColor = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
      body1: TextStyle(fontSize: normalFontSize, color: darkTextColor),
    ),
  );
}