import 'package:flutter/material.dart';
import 'primary_button.dart';

class StickyBottomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const StickyBottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
        ),
      ),
      child: SafeArea(
        child: PrimaryButton(
          text: text,
          onPressed: isLoading ? null : onPressed,
        ),
      ),
    );
  }
}
