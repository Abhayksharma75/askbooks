import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TextThemes for light and dark modes
TextTheme lightTextTheme = TextTheme(
  titleSmall: GoogleFonts.sourceSerif4(
    fontSize: 32,
    color: Colors.black87, // Dark color for light mode
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.sourceSerif4(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black87, // Dark color for light mode
  ),
  headlineSmall: GoogleFonts.sourceSerif4(
    fontSize: 16,
    color: Colors.black, // Accent color for light mode
  ),
  bodySmall: GoogleFonts.sourceSerif4(
    fontSize: 14,
    color: Colors.black87, // Dark color for light mode
  ),
  bodyMedium: TextStyle(
    color: Colors.black, // Dark color for light mode
  ),
);

TextTheme darkTextTheme = TextTheme(
  titleSmall: GoogleFonts.sourceSerif4(
    fontSize: 32,
    color: Colors.white, // Light color for dark mode
    fontWeight: FontWeight.bold,
  ),
  titleMedium: GoogleFonts.sourceSerif4(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.white, // Light color for dark mode
  ),
  headlineSmall: GoogleFonts.sourceSerif4(
    fontSize: 16,
    color: Colors.white10, // Accent color for dark mode
  ),
  bodySmall: GoogleFonts.sourceSerif4(
    fontSize: 14,
    color: Colors.white, // Light color for dark mode
  ),
  bodyMedium: TextStyle(
    color: Colors.white, // Light color for dark mode
  ),
);

// Light Theme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 102, 119, 231),
  scaffoldBackgroundColor: Colors.white,
  textTheme: lightTextTheme
  
);

// Dark Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[800],
  scaffoldBackgroundColor: Colors.grey[900],
  textTheme: darkTextTheme
);

class AppColors {
  static Color lightBlue = const Color(0xffCFEDEF);
  static Color black = Colors.black87;
}

List<Color> boxColors = const [
  Color(0xffCEEDEF),
  Color(0xffBFBFBF),
  Color(0xffEBECF1),
  Color(0xffFDF7DD),
  Color(0xffF9CFE3),
  Color(0xffFBEBC7),
  Color(0xffE9E8E6)
];