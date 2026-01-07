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
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black,),
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          titleMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          titleSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
          bodyLarge: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
          // labelLarge: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        cardTheme: CardThemeData(color: Colors.white,elevation: 0)
    );
  }
}
