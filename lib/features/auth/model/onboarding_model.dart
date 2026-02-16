import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/responsive_layout_extension.dart';

class OnboardingModel {
  OnboardingModel({this.image , this.body , this.title});
  final String? image;
  final String? title;
  final String? body;

}

List<OnboardingModel>onboardingList(BuildContext context) {
  return [
    OnboardingModel(
      image: ImagesManager.onbording_1,
      title: context.loc
          .onbordingModelTitle1,
      body: context.loc
          .onbordingModelBody1,

    ),
    OnboardingModel(
      image: ImagesManager.onbording_2,
      title: context.loc
          .onbordingModelTitle2,
      body: context.loc
          .onbordingModelBody2,
    ),
    OnboardingModel(
      image: ImagesManager.onbording_3,
      title: context.loc
          .onbordingModelTitle3,
      body: context.loc
          .onbordingModelBody3,
    ),
  ];
}