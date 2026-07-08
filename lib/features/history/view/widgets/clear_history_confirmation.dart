import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class ClearHistoryConfirmation {
  static void show(BuildContext context, {required VoidCallback onConfirm}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              sheetContext.addVerticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Clear Your History', style: sheetContext.titleBold18),
                  InkWell(
                    onTap: () => Navigator.of(sheetContext).pop(),
                    child: Card(
                      child: const Icon(Icons.close, weight: 24).pad(8),
                    ),
                  ),
                ],
              ),
              sheetContext.addVerticalSpace(24),
              Text(
                'Are you sure you want to clear your history? This action cannot be undone, so proceed with caution.',
                style: sheetContext.bodyRegular,
              ),
              sheetContext.addVerticalSpace(32),
              PrimaryButton(
                color: ColorManager.warningColor,
                text: 'YES, CLEAR IT',
                onPressed: () {
                  onConfirm();
                  Navigator.of(sheetContext).pop();
                },
              ),
              sheetContext.addVerticalSpace(8),
              PrimaryButton(
                color: Colors.transparent,
                text: 'NO, I CHANGED MY MIND!',
                textColor: ColorManager.warningColor,
                onPressed: () {
                  Navigator.of(sheetContext).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
