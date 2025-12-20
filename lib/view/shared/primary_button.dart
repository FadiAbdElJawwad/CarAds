import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(const Size(double.maxFinite, 50)),
        backgroundColor: WidgetStateProperty.all(color),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}