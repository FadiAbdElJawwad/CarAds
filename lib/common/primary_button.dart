import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;

  const PrimaryButton({
    super.key,
    this.color,
    required this.text,
    this.onPressed,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        fixedSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        backgroundColor: WidgetStateProperty.all(color ?? Colors.black),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: context.buttonBold.copyWith(color: textColor ?? Colors.white),
      ),
    );
  }
}
