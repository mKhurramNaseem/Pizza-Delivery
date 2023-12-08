import 'package:flutter/material.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';
import 'package:hero_rect_tween/theme/app_text_theme.dart';

class AppElevatedButtonTheme {
  static const btnElevation = 20.0;
  static const btnBorderRadius = 10.0;
  static ElevatedButtonThemeData getTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          AppColorScheme.primaryColor,
        ),
        elevation: const MaterialStatePropertyAll(btnElevation),
        textStyle: MaterialStatePropertyAll(
          AppTextTheme.getTheme()
              .bodyMedium
              ?.copyWith(color: AppColorScheme.tertiaryColor),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          AppColorScheme.tertiaryColor,
        ),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(btnBorderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
