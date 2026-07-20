import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/profile/logic/provider/change_phone_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/primary_app_bar.dart';
import '../../../../common/show_snack_bar.dart';

class VerificationScreen extends StatefulWidget {
  final Map<String, dynamic> userData;
  const VerificationScreen({super.key, required this.userData});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool isPhoneVerified = false;
  bool isLicenseVerified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.verification,
        ),
      ),
      body: Column(
        children: [
          Text(
            context.loc.verificationPrompt,
            style: context.titleRegular18,
          ),
          context.addVerticalSpace(16),
          _buildVerificationCard(
            title: context.loc.phoneNumberRequired,
            subtitle: widget.userData['phone'],
            isVerified: isPhoneVerified,
            onVerify: () async {
              final phoneProvider = context.read<ChangePhoneProvider>();
              phoneProvider.phoneController.text = widget.userData['phone'];

              final result = await phoneProvider.sendOtp(
                context,
                isRegistration: true,
              );
              if (result == true) {
                setState(() {
                  isPhoneVerified = true;
                });
              }
            },
          ),
          context.addVerticalSpace(24),
          _buildVerificationCard(
            title: context.loc.commercialLicenseRequired,
            subtitle: widget.userData['commercialLicenseNumber'] ?? context.loc.notAvailable,
            isVerified: isLicenseVerified,
            onVerify: () async {
              final String? uploadedUrl = await AppRouter.goTo<String>(
                screenName: ScreenName.licenseUploadScreen,
              );

              if (uploadedUrl != null && uploadedUrl.isNotEmpty) {
                setState(() {
                  isLicenseVerified = true;
                  widget.userData['licenseImageUrl'] = uploadedUrl;
                });
              }
            },
          ),
        ],
      ).padSymmetric(20),
      bottomNavigationBar: StickyBottomButton(
        text: isPhoneVerified && isLicenseVerified
            ? context.loc.goToHome
            : context.loc.completeVerification,
        onPressed: isPhoneVerified && isLicenseVerified ? _handleFinalSignUp : null,
      ),
    );
  }

  Widget _buildVerificationCard({
    required String title,
    required String subtitle,
    required bool isVerified,
    required VoidCallback onVerify,
  }) {
    return Card(
      color: ColorManager.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xff7F7F7F)),
      ),
      child: ListTile(
        title: Text(title, style: context.bodyBold),
        subtitle: Text(subtitle, style: context.bodyRegular),
        trailing: Card(
          color: isVerified
              ? ColorManager.successColor
              : const Color(0xffF1F1F1),
          child: TextButton(
            onPressed: isVerified ? null : onVerify,
            child: Text(
              isVerified ? context.loc.verified : context.loc.verify,
              style: context.titleRegular18.copyWith(
                fontSize: 16,
                color: isVerified ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleFinalSignUp() async {
    final authProvider = context.read<AuthProvider>();

    await authProvider.signUpUser(
      context: context, // Added context as per AuthProvider refactoring
      name: widget.userData['name'],
      email: widget.userData['email'],
      password: widget.userData['password'],
      phone: widget.userData['phone'],
      role: widget.userData['role'],
      commercialLicenseNumber: widget.userData['commercialLicenseNumber'],
      licenseImageUrl: widget.userData['licenseImageUrl'],
      address: widget.userData['address'],
    );

    if (!mounted) return;

    if (authProvider.state.isSuccess) {
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);
    } else if (authProvider.state.isFailure) {
      showSnackBar(
        context,
        authProvider.state.fallbackMessage ?? context.loc.somethingWentWrong,
      );
    }
  }
}