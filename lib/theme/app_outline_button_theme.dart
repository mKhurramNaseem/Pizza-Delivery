import 'package:flutter/material.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';

class AppOutlinedButtonTheme {
  static const btnBorderRadius = 10.0;
  static OutlinedButtonThemeData getTheme() {
    return const OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColorScheme.tertiaryColor,
        ),
        alignment: Alignment.center,
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(btnBorderRadius),
            ),
            side: BorderSide(
              color: AppColorScheme.primaryColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
