import 'package:flutter/material.dart';

class CarsAdsErrorMessage extends StatelessWidget {
  final String message;

  const CarsAdsErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}