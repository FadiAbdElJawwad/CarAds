import 'package:car_ads/common/skeleton.dart';
import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/common/car_image_extractor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../logic/helper/suggested_ads.dart';
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
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    final isRent = widget.car.purpose == 'rent';
    return Scaffold(
      bottomNavigationBar: StickyBottomButton(
        text: isRent ? 'Rental' : 'Buy ',
        onPressed: () {
          if (isRent && !_isTermsAccepted) {
            showSnackBar(context, 'You must agree to the rental terms to proceed.');
            return;
          }
          AppRouter.goTo(
            screenName: ScreenName.checkout,
            arguments: widget.car,
          );
        },
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
                      Text(isRent ? ' AED/Day' : ' AED', style: context.bodyRegular),
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
              if (isRent) ...[
                context.addVerticalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rental Information:', style: context.bodyBold),
                    context.addVerticalSpace(8),
                    infoBulletPoint("Available From", _formatDate(widget.car.startDate)),
                    infoBulletPoint("Available Until", _formatDate(widget.car.endDate)),
                    infoBulletPoint("Location", widget.car.showroomName ?? 'N/A'),
                  ],
                ),
              ],
              context.addVerticalSpace(24),
              Text('Description', style: context.bodyBold),
              context.addVerticalSpace(4),
              Text(
                widget.car.description ?? 'No description available.',
                style: context.bodyRegular,
              ),
              if (isRent) ...[
                context.addVerticalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rental terms', style: context.bodyBold,),
                    context.addVerticalSpace(4),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Consectetur pharetra proin sed nisi vitae purus vivamus in. Ornare pellentesque vivamus elementum lorem velit eget mauris senectus fusce.',
                      style: context.bodyRegular,),
                    context.addVerticalSpace(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _isTermsAccepted,
                          onChanged: (value) {
                            setState(() {
                              _isTermsAccepted = value ?? false;
                            });
                          },
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                        ),
                        Text('Do you agree to the rental terms',
                          style: context.bodyRegular,),
                      ],
                    )
                  ],
                ),
              ],
              context.addVerticalSpace(24),
              if (widget.car.showroomId != null &&
                  widget.car.showroomId!.isNotEmpty)
                FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.car.showroomId)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Card(
                        child: ListTile(
                          leading: Skeleton(width: 50, height: 50),
                          title: Skeleton(width: 120, height: 18),
                          subtitle: Skeleton(width: 80, height: 14),
                        ),
                      );
                    }

                    if (snapshot.hasError ||
                        !snapshot.hasData ||
                        !snapshot.data!.exists) {
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
                      showroomID: widget.car.showroomId,
                    );
                  },
                )
              else
                ShowroomContactCard(
                  showroomName: widget.car.contactName ?? 'Individual Seller',
                  phoneNumber: widget.car.contactPhone ?? 'N/A',
                  showroomID: widget.car.showroomId,
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

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('d MMM').format(date);
    } catch (e) {
      return dateString;
    }
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
