import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/common/car_image_extractor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../explore/logic/helper/suggested_ads.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import '../widgets/car_features_card.dart';
import '../widgets/showroom_contact_card.dart';

class CarDetailsForm extends StatefulWidget {
  final CarCardModel car;
  const CarDetailsForm({super.key, required this.car});

  @override
  State<CarDetailsForm> createState() => _CarDetailsFormState();
}

class _CarDetailsFormState extends State<CarDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        child: PrimaryButton(
          text: 'Rental',
          onPressed: () {
            AppRouter.goTo(
              screenName: ScreenName.checkout,
              arguments: widget.car,
            );
          },
        ).padSymmetric(20).padVerticalSymmetric(17),
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
                  icon: SvgPicture.asset(ImagesManager.arrowLeft),
                ),
              ),
              context.addVerticalSpace(16),
              CarImageExtractor.buildImage(
                widget.car.carImage,
                height: 160,
                fit: BoxFit.contain,
              ),
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
                      Text('/AED', style: context.bodyRegular),
                    ],
                  ),
                ],
              ),
              context.addVerticalSpace(24),
              CarFeaturesCard(car: widget.car),
              context.addVerticalSpace(24),
              Text('Car Information:', style: context.bodyBold),
              context.addVerticalSpace(8),
              infoBulletPoint("Car Model", widget.car.carModel ?? 'N/A'),
              infoBulletPoint("Year", widget.car.year ?? 'N/A'),
              infoBulletPoint("Mileage", widget.car.mileage ?? 'N/A'),
              context.addVerticalSpace(24),
              Text('Description', style: context.bodyBold),
              context.addVerticalSpace(4),
              Text(
                widget.car.description ?? 'No description available.',
                style: context.bodyRegular,
              ),
              context.addVerticalSpace(24),

              // Dynamic Showroom/Seller Fetching
              if (widget.car.showroomID != null &&
                  widget.car.showroomID!.isNotEmpty)
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.car.showroomID)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError ||
                        !snapshot.hasData ||
                        !snapshot.data!.exists) {
                      // Fallback to static info from car model if user doc fails
                      return ShowroomContactCard(
                        showroomName:
                            widget.car.showroomName ??
                            widget.car.contactName ??
                            'Seller',
                        phoneNumber: widget.car.contactPhone ?? 'N/A',
                      );
                    }

                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    return ShowroomContactCard(
                      showroomName:
                          data['showroomName'] ?? data['name'] ?? 'Showroom',
                      phoneNumber: data['phone'] ?? 'N/A',
                      imageUrl: data['profileImage'] ?? data['licenseImageUrl'],
                      showroomID: widget.car.showroomID,
                    );
                  },
                )
              else
                ShowroomContactCard(
                  showroomName: widget.car.contactName ?? 'Individual Seller',
                  phoneNumber: widget.car.contactPhone ?? 'N/A',
                  showroomID: widget.car.showroomID,
                ),

              context.addVerticalSpace(24),
              Text('Suggested Ads', style: context.bodyBold),
              context.addVerticalSpace(8),
              SuggestedAds(car: widget.car),
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
              TextSpan(text: "$label: "),
              TextSpan(text: value),
            ],
          ),
        ),
      ],
    );
  }
}
