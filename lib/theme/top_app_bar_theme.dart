import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hero_rect_tween/theme/app_color_scheme.dart';

class TopAppBarTheme {
  static const elevation = 20.0;
  static AppBarTheme getTheme() {
    return AppBarTheme(
      backgroundColor: AppColorScheme.primaryColor,
      elevation: elevation,
      centerTitle: false,
      shadowColor: Colors.grey,
      actionsIconTheme: const IconThemeData(
        color: AppColorScheme.tertiaryColor,
      ),
      titleTextStyle: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
