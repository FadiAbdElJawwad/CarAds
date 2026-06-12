import 'dart:io';
import 'package:car_ads/common/network_custom_image_widget.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class UpdateProfileImageSection extends StatelessWidget {
  final VoidCallback onPickImage;
  final File? imageFile;
  final String? profileImageUrl;

  const UpdateProfileImageSection({
    super.key,
    required this.onPickImage,
    this.imageFile,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Card(clipBehavior: Clip.antiAlias, child: _buildImage()),
            TextButton(
              onPressed: onPickImage,
              child: Text(
                'Upload New Picture',
                style: context.bodyRegular.copyWith(
                  color: ColorManager.infoColor,
                ),
              ),
            ),
          ],
        ).padVerticalSymmetric(16),
      ),
    );
  }

  Widget _buildImage() {
    if (imageFile != null) {
      return Image.file(imageFile!, width: 100, height: 100, fit: BoxFit.cover);
    } else if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return NetworkCustomImageWidget(
        imageUrl: profileImageUrl!,
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        ImagesManager.profileImage,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }
  }
}
