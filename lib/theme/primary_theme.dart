import 'package:flutter/material.dart';

abstract class PrimaryTheme {
  PrimaryTheme._();

  static ThemeData generateTheme(BuildContext context){
    return ThemeData(
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,

    );
  }
}