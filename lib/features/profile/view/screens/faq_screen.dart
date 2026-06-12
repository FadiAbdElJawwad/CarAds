import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_app_bar.dart';
import '../../data/model/faq_model.dart';

class FAQScreenScreen extends StatefulWidget {
  const FAQScreenScreen({super.key});

  @override
  State<FAQScreenScreen> createState() => _FAQScreenScreenState();
}

class _FAQScreenScreenState extends State<FAQScreenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(backIconVisible: true, text: 'FAQ’S'),
      ),
      body: Column(
        children: [
          Text(
            'Have Questions? We Have Answers!',
            style: context.titleRegular18,
          ),
          context.addVerticalSpace(8),
          Expanded(
            child: ListView.separated(
              itemCount: faqData.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey).padVerticalSymmetric(8),
              itemBuilder: (context, index) {
                final faq = faqData[index];
                return ExpansionTile(
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
                  ),
                  collapsedShape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                  backgroundColor: Colors.white,
                  title: Text(faq.question, style: context.titleBold18),
                  children: [
                    const Divider(color: Colors.grey),
                    Text(faq.answer, style: context.bodyRegular),
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
