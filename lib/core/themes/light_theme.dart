import 'package:flutter/material.dart';
import 'package:car_ads/core/constant/color_manager.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: ColorManager.backgroundColor,
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            fixedSize: const Size(double.maxFinite, 50),
            backgroundColor: ColorManager.primaryColor,
          ),
        ),
        cardTheme: CardThemeData(color: Colors.white,elevation: 0),
        textTheme: const TextTheme(
          // H1 styles
          displayLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            height: 40 / 34,
            color: ColorManager.blackColor,
          ),
          displayMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 34,
            fontWeight: FontWeight.w400,
            height: 40 / 34,
            color: ColorManager.blackColor,
          ),
          displaySmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 32 / 28,
            color: ColorManager.blackColor,
          ),
          // H2 styles
          headlineLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 28,
            fontWeight: FontWeight.w400,
            height: 32 / 28,
            color: ColorManager.blackColor,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 26,
            fontWeight: FontWeight.w700,
            height: 30 / 26,
            color: ColorManager.blackColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 28 / 22,
            color: ColorManager.blackColor,
          ),
          // Title styles
          titleLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 26,
            fontWeight: FontWeight.w400,
            height: 30 / 26,
            color: ColorManager.blackColor,
          ),
          titleMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 28 / 22,
            color: ColorManager.blackColor,
          ),
          titleSmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 24 / 18,
            color: ColorManager.blackColor,
          ),
          // Body styles
          bodyLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 24 / 18,
            color: ColorManager.blackColor,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 20 / 14,
            color: ColorManager.blackColor,
          ),
          bodySmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 20 / 14,
            color: ColorManager.blackColor,
          ),
          // Label styles (Button and Input)
          labelLarge: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 24 / 16,
            color: ColorManager.blackColor,
          ),
          labelMedium: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 24 / 16,
            color: ColorManager.blackColor,
          ),
          labelSmall: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            height: 20 / 14,
            color: ColorManager.blackColor,
          ),
        ),
    );
  }
}
