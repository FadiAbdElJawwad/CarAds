import 'package:car_ads/common/loading_overlay.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.changeEmailTitle,
        ),
      ),
      body: LoadingOverlay(
        isLoading: provider.isLoading,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    context.loc.dataSecurityMessage,
                    style: context.titleRegular18,
                    textAlign: TextAlign.center,
                  ),
                  context.addVerticalSpace(8),
                  Text(
                    context.loc.addCurrentEmailPrompt,
                    style: context.bodyRegular,
                    textAlign: TextAlign.center,
                  ),
                  context.addVerticalSpace(24),
                  PrimaryTextField(
                    hint: context.loc.currentEmailHint,
                    controller: provider.currentEmailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => val?.validateEmail(context),
                  ),
                  context.addVerticalSpace(16),
                  PrimaryTextField(
                    hint: context.loc.currentPasswordHint,
                    controller: provider.passwordController,
                    obscureText: true,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return context.loc.passwordRequiredError;
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
                text: context.loc.continueButton,
                onPressed: provider.isLoading
                    ? null
                    : () => provider.proceedToNewEmail(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}