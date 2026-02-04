import 'package:flutter/material.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../logic/helper/car_image_extractor.dart';
import '../../model/car_card_model.dart';

class CarAdsCard extends StatelessWidget {
  final CarCardModel car;

  const CarAdsCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.goTo(
          screenName: ScreenName.carDetailsForm,
          arguments: car,
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarImageExtractor.buildImage(car.carImage),
            context.addVerticalSpace(16),
            Text(
              car.carName ?? 'No Name',
              style: context.inputBold14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            context.addVerticalSpace(4),
            Row(
              children: [
                Text('${car.price ?? 0} K', style: context.inputBold14),
                Text(' AED', style: context.inputRegular14),
              ],
            ),
            context.addVerticalSpace(4),
            Row(
              children: [
                Image.asset(ImagesManager.showroomIcon),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    car.showroomName ?? '',
                    style: context.bodyRegular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            context.addVerticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: ColorManager.backgroundColor,
                  child: Text(
                    car.gearType ?? '',
                    style: context.inputRegular14.copyWith(
                        fontSize: 12, color: ColorManager.gearTypeColor),
                  ).padVerticalSymmetric(4).padSymmetric(11),
                ),
                CarImageExtractor.buildLogo(car.carLogo),
              ],
            )
          ],
        ).padSymmetric(8).padVerticalSymmetric(16),
      ),
    );
  }
}
