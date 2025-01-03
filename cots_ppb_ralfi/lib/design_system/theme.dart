import 'package:flutter/material.dart';

class AppColors {
  static const Color primary1 = Color(0xFF00AA13);
  static const Color primary2 = Color(0xFFEE2737); 
  static const Color primary3 = Color(0xFF06400);
  static const Color primary4 = Color(0xFF00AED6); 
  static const Color primary5 = Color(0xFF93328E); 
  static const Color primary6 = Color(0xFFDF1995); 
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  
  static const Color lightGreen = Color(0xFF30B058);
  static const Color greenGojek = Color(0xFF00AA13);
  static const Color green = Color(0xFF006C02);
  static const Color darkGreen = Color(0xFF004901);


  static const Color darkGrey = Color(0xFFF9F9F9);
  static const Color grey = Color(0xFF727272);
  static const Color lightGrey = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const String _fontFamily = 'SF Pro';

  // Headings
  static TextStyle heading1 = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.5,
  );

  static TextStyle heading2 = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  // Subheadings
  static TextStyle subheading1 = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );

  static TextStyle subheading2 = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  // Body text
  static TextStyle bodyRegular = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  static TextStyle bodySemibold = const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
}
