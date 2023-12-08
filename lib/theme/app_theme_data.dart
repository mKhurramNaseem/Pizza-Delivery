import 'package:flutter/material.dart';
import 'package:hero_rect_tween/theme/app_elevated_button_theme.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';
import 'package:hero_rect_tween/theme/app_outline_button_theme.dart';
import 'package:hero_rect_tween/theme/app_text_theme.dart';
import 'package:hero_rect_tween/theme/top_app_bar_theme.dart';

class AppThemeData {
  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: AppColorScheme.getScheme(),
      textTheme: AppTextTheme.getTheme(),
      appBarTheme: TopAppBarTheme.getTheme(),
      useMaterial3: true,
      elevatedButtonTheme: AppElevatedButtonTheme.getTheme(),
      outlinedButtonTheme: AppOutlinedButtonTheme.getTheme(),
    );
  }
}
