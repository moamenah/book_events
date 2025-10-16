import 'package:book_events/utils/app_colors.dart';
import 'package:book_events/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    focusColor: AppColors.whiteColor,
    dividerColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(),


    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.bold12White,
      unselectedLabelStyle: AppStyles.bold12White,

    ),


    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: StadiumBorder(
          side: BorderSide(color: AppColors.whiteColor,width: 4)
      ),

      // RoundedRectangleBorder(
      //   borderRadius: BorderRadiusGeometry.circular(30),
      //   side: BorderSide(color: AppColors.whiteColor,width: 4)
      // ),
    ),

    primaryColor: AppColors.primaryLight,
    textTheme: TextTheme(
        headlineLarge: AppStyles.bold20Black,
        headlineMedium: AppStyles.medium16primary,
        headlineSmall: AppStyles.medium16White,
        titleLarge: AppStyles.medium16black

    ),
    scaffoldBackgroundColor: AppColors.whiteBgColor,


  );



  static final ThemeData darkTheme = ThemeData(
      focusColor: AppColors.primaryLight,
      dividerColor: AppColors.whiteColor,

      appBarTheme: AppBarTheme(),


      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
          unselectedLabelStyle: AppStyles.bold12White
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryDark,
        shape: StadiumBorder(
            side: BorderSide(color: AppColors.whiteColor,width: 4)
        ),
      ),




      primaryColor: AppColors.primaryDark,
      textTheme: TextTheme(
          headlineLarge: AppStyles.bold20White,
          headlineMedium: AppStyles.medium16White,
          headlineSmall: AppStyles.medium16White,
          titleLarge: AppStyles.medium16White

      ),
      scaffoldBackgroundColor: AppColors.primaryDark
  );





}