import 'package:car_ads/common/network_custom_image_widget.dart';
import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? profileImage;

  const ProfileHeaderCard({
    super.key,
    this.name,
    this.phone,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Card(
          clipBehavior: Clip.antiAlias,
          color: ColorManager.backgroundColor,
          child: profileImage != null && profileImage!.isNotEmpty
              ? NetworkCustomImageWidget(
                  imageUrl: profileImage!,
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  ImagesManager.profileImage,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
        ),
        title: name == null
            ? const Skeleton(height: 20, width: 150)
            : Text(name!, style: context.bodyBold),
        subtitle: phone == null
            ? const Skeleton(height: 15, width: 120).padVerticalSymmetric(4)
            : Text(
                phone!,
                style: context.bodyRegular.copyWith(color: Colors.grey),
              ),
        trailing: Card(
          color: ColorManager.backgroundColor,
          child: IconButton(
            onPressed: () {
              AppRouter.goTo(screenName: ScreenName.updateProfile);
            },
            icon: const Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
