import 'package:car_ads/common/loading_overlay.dart';
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
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: PrimaryAppBar(
              backIconVisible: true,
              text: context.loc.verifyOtpTitle,
            ),
          ),
          body: LoadingOverlay(
            isLoading: provider.isLoading,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.addVerticalSpace(20),
                      Text(
                        context.loc.enterOtpSentTo(provider.phoneController.text),
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
                    text: isRegistration
                        ? context.loc.verify
                        : context.loc.verifyAndUpdate,
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
        );
      },
    );
  }
}