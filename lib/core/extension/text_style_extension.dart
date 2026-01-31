import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  // H1 styles
  TextStyle get h1Bold34 => Theme.of(this).textTheme.displayLarge!;
  TextStyle get h1Regular34 => Theme.of(this).textTheme.displayMedium!;
  TextStyle get h1Bold28 => Theme.of(this).textTheme.displaySmall!;
  TextStyle get h1Regular28 => Theme.of(this).textTheme.headlineLarge!;

  // H2 styles
  TextStyle get h2Bold26 => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get h2Bold22 => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get h2Regular26 => Theme.of(this).textTheme.titleLarge!;
  TextStyle get h2Regular22 => Theme.of(this).textTheme.titleMedium!;

  // Title styles
  TextStyle get titleBold18 => Theme.of(this).textTheme.titleSmall!;
  TextStyle get titleRegular18 => Theme.of(this).textTheme.bodyLarge!;

  // Button styles
  TextStyle get buttonBold => Theme.of(this).textTheme.labelLarge!;
  TextStyle get buttonRegular => Theme.of(this).textTheme.labelMedium!;

  // Input styles
  TextStyle get inputBold16 => Theme.of(this).textTheme.labelLarge!;
  TextStyle get inputRegular16 => Theme.of(this).textTheme.labelMedium!;
  TextStyle get inputBold14 => Theme.of(this).textTheme.labelSmall!;
  TextStyle get inputRegular14 => Theme.of(this).textTheme.bodySmall!;

  // Body styles
  TextStyle get bodyBold => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyRegular => Theme.of(this).textTheme.bodySmall!;
}