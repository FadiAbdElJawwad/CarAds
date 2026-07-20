import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
import '../../data/model/privacy_policy_model.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final policyData = privacyPolicyList(context); // Localized data list

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.privacyPolicyTitle,
        ),
      ),
      body: Column(
        children: [
          Text(
            context.loc.privacyPolicyIntro,
            style: context.titleRegular18,
          ),
          context.addVerticalSpace(16),
          Expanded(
            child: ListView.separated(
              itemCount: policyData.length,
              separatorBuilder: (context, index) =>
                  context.addVerticalSpace(16),
              itemBuilder: (context, index) {
                final item = policyData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: context.bodyRegular),
                    Text(item.content, style: context.bodyRegular),
                  ],
                );
              },
            ),
          ),
        ],
      ).padSymmetric(20),
    );
  }
}