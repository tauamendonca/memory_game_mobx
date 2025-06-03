import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DragonTheme {
  static const MaterialColor color =
      MaterialColor(_dragonPrimaryValue, <int, Color>{
        50: Color(0xFFFCE9E9),
        100: Color(0xFFF7C7C8),
        200: Color(0xFFF09A9B),
        300: Color(0xFFE96D6F),
        400: Color(0xFFE24142),
        500: Color(_dragonPrimaryValue),
        600: Color(0xFFBC1A1C),
        700: Color(0xFF901415),
        800: Color(0xFF630E0F),
        900: Color(0xFF370808),
      });

  static const int _dragonPrimaryValue = 0xFFDD1F21;

  static const Color background = Color(0xFF121212);

  static ButtonStyle outlineButtonStyle({
    Color color = Colors.white,
    double padding = 24,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: color,
      padding: EdgeInsets.symmetric(vertical: padding),
      side: BorderSide(color: color),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    primarySwatch: color,
    primaryColor: color,
    textTheme: GoogleFonts.antonTextTheme(ThemeData.dark().textTheme),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle()),
  );
}
