import 'package:car_ads/common/car_image_extractor.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsImagePicker extends StatelessWidget {
  final AddAdsProvider provider;

  const AddAdsImagePicker({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.loc.uploadPhotos, style: context.inputRegular14),
        context.addVerticalSpace(8),
        InkWell(
          onTap: () => provider.pickImage(),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child:
            (provider.selectedImage == null &&
                provider.editingCar?.carImage == null)
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.grey,
                  size: 40,
                ),
                context.addVerticalSpace(8),
                Text(
                  context.loc.uploadPhotosDescription,
                  style: context.bodyRegular.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  if (provider.selectedImage != null)
                    Image.file(
                      provider.selectedImage!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  else
                    CarImageExtractor.buildImage(
                      provider.editingCar!.carImage,
                      fit: BoxFit.contain,
                    ).center(),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => provider.pickImage(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}