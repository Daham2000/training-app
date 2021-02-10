import 'package:flutter/material.dart';

abstract class PrimaryTheme {
  PrimaryTheme._();

  static ThemeData generateTheme(BuildContext context) {
    return ThemeData(
        brightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        backgroundColor: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          textTheme: TextTheme(
              headline6: TextStyle(color: Colors.white, fontSize: 20.0)),
          iconTheme: IconThemeData(color: Colors.white),

        ));
  }
}
