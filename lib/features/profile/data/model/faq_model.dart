import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class FAQModel {
  final String question;
  final String answer;

  FAQModel({required this.question, required this.answer});
}

List<FAQModel> faqList(BuildContext context) {
  return [
    FAQModel(
      question: context.loc.faqQuestion1,
      answer: context.loc.faqAnswer1,
    ),
    FAQModel(
      question: context.loc.faqQuestion2,
      answer: context.loc.faqAnswer2,
    ),
    FAQModel(
      question: context.loc.faqQuestion3,
      answer: context.loc.faqAnswer3,
    ),
    FAQModel(
      question: context.loc.faqQuestion4,
      answer: context.loc.faqAnswer4,
    ),
    FAQModel(
      question: context.loc.faqQuestion5,
      answer: context.loc.faqAnswer5,
    ),
  ];
}