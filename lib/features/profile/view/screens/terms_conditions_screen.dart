import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../data/model/privacy_policy_model.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final termsData = privacyPolicyList(context); // Use localized data list

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.termsConditionsTitle,
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
              itemCount: termsData.length,
              separatorBuilder: (context, index) =>
                  context.addVerticalSpace(16),
              itemBuilder: (context, index) {
                final item = termsData[index];
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