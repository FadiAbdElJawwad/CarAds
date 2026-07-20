import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyModel {
  final String title;
  final String content;

  PrivacyPolicyModel({required this.title, required this.content});
}

List<PrivacyPolicyModel> privacyPolicyList(BuildContext context) {
  return [
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle1,
      content: context.loc.privacySectionContent1,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle2,
      content: context.loc.privacySectionContent2,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle3,
      content: context.loc.privacySectionContent3,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle4,
      content: context.loc.privacySectionContent4,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle5,
      content: context.loc.privacySectionContent5,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle6,
      content: context.loc.privacySectionContent6,
    ),
    PrivacyPolicyModel(
      title: context.loc.privacySectionTitle7,
      content: context.loc.privacySectionContent7,
    ),
  ];
}