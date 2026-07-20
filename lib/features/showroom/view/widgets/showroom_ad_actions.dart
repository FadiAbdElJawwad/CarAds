import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/features/showroom/view/widgets/delete_ad_confirmation_sheet.dart';
import 'package:flutter/material.dart';

class ShowroomAdActions extends StatelessWidget {
  final CarCardModel car;
  final String? userId;

  const ShowroomAdActions({
    super.key,
    required this.car,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Card(
        color: ColorManager.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: PopupMenuButton<String>(
          color: Colors.white,
          icon: const Icon(Icons.more_horiz, size: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (String value) {
            if (value == 'edit') {
              AppRouter.goTo(
                screenName: ScreenName.addAdsScreen,
                arguments: car,
              );
            } else if (value == 'delete') {
              DeleteAdConfirmationSheet.show(context, car: car, userId: userId);
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'delete',
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.warningColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.delete, color: ColorManager.warningColor, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(context.loc.deleteAds),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'edit',
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.edit, color: Colors.black, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(context.loc.editAds),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}