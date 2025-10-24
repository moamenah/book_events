import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  // ===== 20px =====
  static TextStyle semi20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static TextStyle semi20Primary = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryLight,
  );

  static TextStyle bold20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle bold12White = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle bold24White = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
  static TextStyle medium16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );

  static TextStyle medium16Grey = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.greyColor,
  );
  static TextStyle medium20White = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );



  static TextStyle medium16black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );





  static TextStyle medium16(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }
  static TextStyle bold20T(BuildContext context) {
    return GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }



  static TextStyle bold20Black = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle bold20Primary = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLight,
  );
  static TextStyle medium20primary = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryLight,
  );
  static TextStyle medium16primary = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryLight,
  );
  static TextStyle regular20white = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle regular14white = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );

  // ===== 16px =====
  static TextStyle bold16White = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle bold16Black = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle bold16Primary = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLight,
  );

  // ===== 14px =====
  static TextStyle bold14White = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );

  static TextStyle bold14Black = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );

  static TextStyle bold14Primary = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryLight,
  );
}
