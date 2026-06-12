import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/string_validation.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/profile/logic/provider/change_email_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../common/primary_button.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChangeEmailProvider>();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(backIconVisible: true, text: 'Change Your Email'),
      ),
      body: Stack(
        children: [
          Form(
            key: provider.currentEmailFormKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        'Your data is kept secure by us!',
                        style: context.titleRegular18,
                        textAlign: TextAlign.center,
                      ),
                      context.addVerticalSpace(8),
                      Text(
                        'Add your Current Email Address',
                        style: context.bodyRegular,
                        textAlign: TextAlign.center,
                      ),
                      context.addVerticalSpace(24),
                      PrimaryTextField(
                        hint: 'Current Email Address',
                        controller: provider.currentEmailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val?.validateEmail(context),
                      ),
                      context.addVerticalSpace(16),
                      PrimaryTextField(
                        hint: 'Current Password',
                        controller: provider.passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ).padSymmetric(20),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: PrimaryButton(
                    text: 'Continue',
                    onPressed: provider.isLoading
                        ? null
                        : () => provider.proceedToNewEmail(context),
                  ),
                ),
              ],
            ),
          ),
          if (provider.isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
