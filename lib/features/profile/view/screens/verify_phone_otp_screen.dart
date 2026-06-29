import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/profile/logic/provider/change_phone_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class VerifyPhoneOtpScreen extends StatelessWidget {
  final bool isRegistration;
  const VerifyPhoneOtpScreen({super.key, this.isRegistration = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePhoneProvider>(
      builder: (context, provider, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: PrimaryAppBar(backIconVisible: true, text: 'Verify OTP'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        context.addVerticalSpace(20),
                        Text(
                          'Enter the 6-digit code sent to ${provider.phoneController.text}',
                          style: context.bodyRegular.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        context.addVerticalSpace(32),
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.black,
                          showFieldAsBox: true,
                          fieldWidth: 45,
                          onSubmit: (String verificationCode) {
                            provider.setOtpCode(verificationCode);
                          },
                        ),
                      ],
                    ).padSymmetric(20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5),
                      ),
                    ),
                    child: PrimaryButton(
                      text: isRegistration ? 'Verify' : 'Verify & Update',
                      onPressed: provider.isLoading
                          ? null
                          : () => provider.verifyOtp(
                              context,
                              isRegistration: isRegistration,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            if (provider.isLoading)
              const Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
