import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static const largeFontSize = 30.0;
  static const mediumFontSize = 20.0;
  static const smallFontSize = 10.0;
  static const textColor = Colors.black;
  static TextTheme getTheme() {
    return TextTheme(
      bodyLarge: GoogleFonts.ebGaramond(
        textStyle: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          overflow: TextOverflow.ellipsis,
          fontSize: largeFontSize,
        ),
      ),
      bodyMedium: GoogleFonts.ebGaramond(
        textStyle: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.ellipsis,
          fontSize: mediumFontSize,
        ),
      ),
      bodySmall: GoogleFonts.ebGaramond(
        textStyle: const TextStyle(
          color: textColor,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.ellipsis,
          fontSize: smallFontSize,
        ),
      ),
    );
  }
}
