import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/images_manager.dart';

class ConfirmChangeScreen extends StatelessWidget {
  final String? message;
  const ConfirmChangeScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Well Done', style: context.h2Bold22,),
            const SizedBox(height: 20),
            Image.asset(ImagesManager.wellDoneImage),
            const SizedBox(height: 20),
            Text(
              message ?? 'Congratulations! Your changes have been saved successfully!',
              style: context.bodyRegular, 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            PrimaryButton(text: 'Back To Profile',
            onPressed: (){
              AppRouter.backTo(screenName: ScreenName.navButtonBar);
            },)
          ],
        ).padSymmetric(20),
      ),
    );
  }
}
