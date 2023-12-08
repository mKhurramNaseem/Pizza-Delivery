import 'package:flutter/material.dart';

class AppColorScheme {
  static const primaryColor = Color.fromARGB(255, 97, 119, 127);
  static const secondaryColor = Colors.black;
  static const tertiaryColor = Colors.white;
  static ColorScheme getScheme() {
    return ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
    );
  }
}
