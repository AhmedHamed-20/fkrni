import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataValues {
  static ThemeData lightMode = ThemeData(
      primaryColor: Colors.deepPurple[200],
      scaffoldBackgroundColor: Colors.deepPurple[50],
      cardColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.caveat(
          color: Colors.deepPurple[200],
          fontWeight: FontWeight.w900,
          fontSize: 28,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: GoogleFonts.rubik(
          color: Colors.black,
          fontSize: 16,
        ),
        titleLarge: GoogleFonts.rubik(
          color: Colors.black,
          fontSize: 16,
        ),
        labelMedium: GoogleFonts.rubik(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.deepPurple[200],
        size: 24,
      ));

  static ThemeData darkMode = ThemeData(
      primaryColor: Colors.deepPurple[200],
      scaffoldBackgroundColor: const Color(0xff02010a),
      cardColor: Colors.deepPurple.withOpacity(0.3),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.caveat(
          color: Colors.deepPurple[200],
          fontWeight: FontWeight.w900,
          fontSize: 28,
        ),
      ),
      textTheme: TextTheme(
        titleMedium: GoogleFonts.rubik(
          color: Colors.white,
          fontSize: 16,
        ),
        titleLarge: GoogleFonts.rubik(
          color: Colors.white,
          fontSize: 16,
        ),
        labelMedium: GoogleFonts.rubik(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.deepPurple[200],
        size: 24,
      ));
}
