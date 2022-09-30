import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
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
}
