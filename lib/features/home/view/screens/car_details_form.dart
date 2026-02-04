import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../model/car_card_model.dart';
import '../widgets/car_ads_list.dart';
import '../widgets/car_features_card.dart';
import '../widgets/contact_card.dart';

class CarDetailsForm extends StatefulWidget {
  final CarCardModel car;
  const CarDetailsForm({super.key, required this.car});

  @override
  State<CarDetailsForm> createState() => _CarDetailsFormState();
}

class _CarDetailsFormState extends State<CarDetailsForm> {

  String? _getDirectGoogleDriveUrl(String? url) {
    if (url == null || !url.startsWith('https://drive.google.com/file/d/')) {
      return url;
    }
    try {
      final id = url.split('/d/')[1].split('/')[0];
      return 'https://drive.google.com/uc?export=view&id=$id';
    } catch (e) {
      return url;
    }
  }

  Widget _buildImage(String? imagePath) {
    final directUrl = _getDirectGoogleDriveUrl(imagePath);
    if (directUrl == null || directUrl.isEmpty) {
      return Image.asset(ImagesManager.toyota, fit: BoxFit.contain, height: 160, width: double.infinity,);
    }

    if (directUrl.startsWith('http')) {
      return Image.network(directUrl, height: 160, width: double.infinity, fit: BoxFit.contain);
    } else {
      return Image.asset(directUrl, height: 160, width: double.infinity, fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        child: PrimaryButton(text: 'Buy', onPressed: () {
          AppRouter.goTo(screenName: ScreenName.checkout);
        })
            .padSymmetric(20)
            .padVerticalSymmetric(17),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: IconButton(
                    onPressed: () {
                      AppRouter.back();
                    },
                    icon: SvgPicture.asset(ImagesManager.arrowLeft)),
              ),
              context.addVerticalSpace(16),
              _buildImage(widget.car.carImage),
              context.addVerticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.car.carName ?? 'No Name',
                    style: context.bodyBold,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.car.price ?? 0}K',
                        style: context.bodyBold,
                      ),
                      Text(
                        '/AED',
                        style: context.bodyRegular,
                      )
                    ],
                  )
                ],
              ),
              context.addVerticalSpace(24),
              CarFeaturesCard(car: widget.car),
              context.addVerticalSpace(24),
              Text(
                'Car Information:',
                style: context.bodyBold,
              ),
              context.addVerticalSpace(8),
              infoBulletPoint("Car Model", widget.car.carName ?? 'N/A'),
              infoBulletPoint("Year", widget.car.year),
              infoBulletPoint("Mileage", widget.car.mileage),
              context.addVerticalSpace(24),
              Text(
                'Description',
                style: context.bodyBold,
              ),
              context.addVerticalSpace(4),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.',
                style: context.bodyRegular,
              ),
              context.addVerticalSpace(24),
              const ContactCard(),
              context.addVerticalSpace(24),
              Text(
                'Suggested Ads',
                style: context.bodyBold,
              ),
              context.addVerticalSpace(8),
              CarAdList(
                // selectedCarType: widget.car.carName,
                listLength:4,
              )
            ],
          ).padSymmetric(20).padTop(16),
        ),
      ),
    );
  }

  Widget infoBulletPoint(String label, String value) {
    return Row(
      children: [
        Text("•", style: context.titleBold18).padSymmetric(10),
        RichText(
          text: TextSpan(
            style: context.bodyRegular,
            children: [
              TextSpan(
                text: "$label: ",
              ),
              TextSpan(
                text: value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
