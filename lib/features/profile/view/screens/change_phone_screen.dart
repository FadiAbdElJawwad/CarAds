import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/profile/logic/provider/change_phone_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePhoneProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: PrimaryAppBar(
              backIconVisible: true,
              text: context.loc.changePhoneTitle,
            ),
          ),
          body: LoadingOverlay(
            isLoading: provider.isLoading,
            child: Form(
              key: provider.phoneFormKey,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        context.addVerticalSpace(20),
                        Text(
                          context.loc.enterNewMobilePrompt,
                          style: context.bodyRegular.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        context.addVerticalSpace(24),
                        PrimaryTextField(
                          label: context.loc.mobileNumberLabel,
                          controller: provider.phoneController,
                          hint: context.loc.phoneHint,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return context.loc.enterPhoneError;
                            }
                            if (!val.startsWith('+')) {
                              return context.loc.includeCountryCodeError;
                            }
                            return null;
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
                      text: context.loc.sendOtpButton,
                      onPressed: provider.isLoading
                          ? null
                          : () => provider.sendOtp(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}