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
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: PrimaryAppBar(backIconVisible: true, text: 'Change Phone'),
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
                          'Enter your new mobile number to receive an OTP code.',
                          style: context.bodyRegular.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        context.addVerticalSpace(24),
                        PrimaryTextField(
                          label: 'Mobile Number',
                          controller: provider.phoneController,
                          hint: '+970 XXXXXXXXX',
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!val.startsWith('+')) {
                              return 'Please include country code (e.g., +971)';
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
                      text: 'Send OTP',
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
