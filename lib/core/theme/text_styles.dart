import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextstyles {
  static TextStyle xLarge({
    double fontSize = 28,
    double textHeight = 32,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w700,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);
  static TextStyle large({
    double fontSize = 24,
    double textHeight = 29,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w600,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);

  static TextStyle title({
    double fontSize = 20,
    double textHeight = 24,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w500,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);

  static TextStyle titleMedium({
    double fontSize = 18,
    double textHeight = 22,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w500,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);

  static TextStyle bodyLarge({
    double fontSize = 16,
    double textHeight = 19,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w400,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);

  static TextStyle bodyMedium({
    double fontSize = 14,
    double textHeight = 17,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w400,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);
  static TextStyle bodySmall({
    double fontSize = 12,
    double textHeight = 16,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w400,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);
  static TextStyle bodyXsmall({
    double fontSize = 10,
    double textHeight = 14,
    double? decorationThickness,
    double? letterSpacing,
    FontWeight weight = FontWeight.w400,
    Color textColor = Colors.white,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Color decorationColor = Colors.white,
    TextDecorationStyle? decorationStyle,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.montserrat(
          letterSpacing: letterSpacing?.spMin,
          fontSize: fontSize.spMin,
          height: (textHeight / fontSize).spMin,
          fontWeight: weight,
          color: textColor,
          decorationThickness: decorationThickness,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontStyle: fontStyle);
}
