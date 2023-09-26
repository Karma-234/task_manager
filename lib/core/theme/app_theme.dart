import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/core/theme/colors.dart';

class AppTheme {
  static InputDecorationTheme inputDecor = InputDecorationTheme(
    hintStyle: GoogleFonts.montserrat(
      fontSize: 16.spMin,
      height: (20 / 16).spMin,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelStyle: GoogleFonts.montserrat(
      fontSize: 14.spMin,
      height: (17 / 14).spMin,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    fillColor: const Color.fromRGBO(255, 255, 255, 0.03),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.white),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.white),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: AppColors.p3),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );
}
