import 'package:flutter/material.dart';

class CheckoutUiHelper {
  final BuildContext context;

  CheckoutUiHelper(this.context);

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  void hideLoading() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
