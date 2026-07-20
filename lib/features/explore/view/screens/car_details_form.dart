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
        text: isRent ? context.loc.rentalButton : context.loc.buyButton,
        onPressed: () {
          if (isRent && !_isTermsAccepted) {
            showSnackBar(context, context.loc.agreeTermsError);
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
                  icon: SvgPicture.asset(
                      ImagesManager.arrowLeft,
                  matchTextDirection: true,),
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
                    widget.car.carName ?? context.loc.noName,
                    style: context.bodyBold,
                  ),
                  Row(
                    children: [
                      Text(
                        '${widget.car.price ?? 0}${context.loc.thousandSuffix}',
                        style: context.bodyBold,
                      ),
                      Text(
                        isRent ? ' ${context.loc.aedPerDay}' : ' ${context.loc.aed}',
                        style: context.bodyRegular,
                      ),
                    ],
                  ),
                ],
              ),
              context.addVerticalSpace(24),
              CarFeaturesCard(car: widget.car),
              context.addVerticalSpace(24),
              Text(context.loc.carInformation, style: context.bodyBold),
              context.addVerticalSpace(8),
              infoBulletPoint(context.loc.modelLabel, widget.car.carModel ?? context.loc.notAvailable),
              infoBulletPoint(context.loc.year, widget.car.year ?? context.loc.notAvailable),
              infoBulletPoint(context.loc.mileage, widget.car.mileage ?? context.loc.notAvailable),
              if (isRent) ...[
                context.addVerticalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.loc.rentalInformation, style: context.bodyBold),
                    context.addVerticalSpace(8),
                    infoBulletPoint(context.loc.availableFrom, _formatDate(widget.car.startDate)),
                    infoBulletPoint(context.loc.availableUntil, _formatDate(widget.car.endDate)),
                    infoBulletPoint(context.loc.location, widget.car.showroomName ?? context.loc.notAvailable),
                  ],
                ),
              ],
              context.addVerticalSpace(24),
              Text(context.loc.description, style: context.bodyBold),
              context.addVerticalSpace(4),
              Text(
                widget.car.description ?? context.loc.noDescription,
                style: context.bodyRegular,
              ),
              if (isRent) ...[
                context.addVerticalSpace(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.loc.rentalTerms, style: context.bodyBold),
                    context.addVerticalSpace(4),
                    Text(
                      context.loc.dummyTermsText,
                      style: context.bodyRegular,
                    ),
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
                        Text(
                          context.loc.agreeRentalTermsPrompt,
                          style: context.bodyRegular,
                        ),
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
                            context.loc.seller,
                        phoneNumber: widget.car.contactPhone ?? context.loc.notAvailable,
                      );
                    }

                    final data = snapshot.data!.data() as Map<String, dynamic>;
                    return ShowroomContactCard(
                      showroomName:
                      data['showroomName'] ?? data['name'] ?? context.loc.showroomDefaultName,
                      phoneNumber: data['phone'] ?? context.loc.notAvailable,
                      imageUrl: data['profileImage'] ?? data['licenseImageUrl'],
                      showroomID: widget.car.showroomId,
                    );
                  },
                )
              else
                ShowroomContactCard(
                  showroomName: widget.car.contactName ?? context.loc.individualSellerLabel,
                  phoneNumber: widget.car.contactPhone ?? context.loc.notAvailable,
                  showroomID: widget.car.showroomId,
                ),

              context.addVerticalSpace(24),
              Text(context.loc.suggestedAds, style: context.bodyBold),
              context.addVerticalSpace(8),
              SuggestedAds(car: widget.car),
            ],
          ).padSymmetric(20).padTop(16),
        ),
      ),
    );
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return context.loc.notAvailable;
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