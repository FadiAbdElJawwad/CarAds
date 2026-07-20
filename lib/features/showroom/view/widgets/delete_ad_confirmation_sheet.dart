import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter/material.dart';

class DeleteAdConfirmationSheet extends StatelessWidget {
  final CarCardModel car;
  final String? userId;

  const DeleteAdConfirmationSheet({
    super.key,
    required this.car,
    required this.userId,
  });

  static Future<void> show(
      BuildContext context, {
        required CarCardModel car,
        required String? userId,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DeleteAdConfirmationSheet(car: car, userId: userId),
    );
  }

  Future<void> _handleDelete(BuildContext context) async {
    try {
      final carId = car.carId;
      if (carId != null) {
        await CarFirestoreService().deleteCar(carId);

        if (context.mounted) {
          showSnackBar(context, context.loc.adDeletedSuccess);

          if (userId != null) {
            await NotificationService().sendNotification(
              userId: userId!,
              title: context.loc.adDeletedTitle,
              body: context.loc.adDeletedBody(car.carName ?? ''),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, context.loc.errorWithDetails(e.toString()));
      }
    } finally {
      if (context.mounted) {
        AppRouter.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorManager.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[400],
              ),
            ),
            context.addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.loc.deleteAdsTitle, style: context.titleBold18),
                Card(
                  elevation: 0,
                  child: IconButton(
                    onPressed: () => AppRouter.back(),
                    icon: const Icon(Icons.clear, size: 20),
                  ),
                ),
              ],
            ),
            context.addVerticalSpace(24),
            Text(
              context.loc.deleteAdConfirmationPrompt,
              style: context.bodyBold,
              textAlign: TextAlign.center,
            ),
            context.addVerticalSpace(32),
            PrimaryButton(
              text: context.loc.confirmDeleteAd,
              color: ColorManager.warningColor,
              onPressed: () => _handleDelete(context),
            ),
            context.addVerticalSpace(16),
            PrimaryButton(
              text: context.loc.keepAd,
              color: Colors.transparent,
              textColor: ColorManager.warningColor,
              onPressed: () => AppRouter.back(),
            ),
            context.addVerticalSpace(MediaQuery.of(context).padding.bottom + 8),
          ],
        ).padSymmetric(20),
      ),
    );
  }
}