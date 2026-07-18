import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';

class RentalCompletedScreen extends StatelessWidget {
  const RentalCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StickyBottomButton(
        text: 'Go to home',
        onPressed: () {
          AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagesManager.rentalCompletedImage, height: 200),
          context.addVerticalSpace(40),
          Text('Rental Completed', style: context.h2Bold22),
          context.addVerticalSpace(16),
          Text(
            'Your car rental request has been received, and we will get back to you as soon as we can. Please keep an eye out for notifications to stay updated.',
            style: context.bodyRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ).padSymmetric(20),
    );
  }
}
