import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';

class AddAdsPostButton extends StatelessWidget {
  final bool isLoading;
  final bool isEditing;
  final VoidCallback onPressed;

  const AddAdsPostButton({
    super.key,
    required this.isLoading,
    required this.isEditing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
      ),
      child: PrimaryButton(
        text: isEditing ? context.loc.saveChanges : context.loc.postAd,
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}