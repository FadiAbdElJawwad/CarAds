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
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(backIconVisible: true, text: 'Privacy Policy'),
      ),
      body: Column(
        children: [
          Text(
            'At Car Ads, we are committed to safeguarding your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, and protect your data when you use our mobile application.',
            style: context.titleRegular18,
          ),
          context.addVerticalSpace(16),
          Expanded(
            child: ListView.separated(
              itemCount: privacyPolicyData.length,
              separatorBuilder: (context, index) =>
                  context.addVerticalSpace(16),
              itemBuilder: (context, index) {
                final item = privacyPolicyData[index];
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
