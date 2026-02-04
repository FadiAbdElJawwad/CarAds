import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/responsive_layout_extension.dart';

class OnbordingModel {
  OnbordingModel({this.image , this.body , this.title});
  final String? image;
  final String? title;
  final String? body;

}

List<OnbordingModel>onbordingList(BuildContext context) {
  return [
    OnbordingModel(
      image: ImagesManager.onbording_1,
      title: context.loc
          .onbordingModelTitle1,
      body: context.loc
          .onbordingModelBody1,

    ),
    OnbordingModel(
      image: ImagesManager.onbording_2,
      title: context.loc
          .onbordingModelTitle2,
      body: context.loc
          .onbordingModelBody2,
    ),
    OnbordingModel(
      image: ImagesManager.onbording_3,
      title: context.loc
          .onbordingModelTitle3,
      body: context.loc
          .onbordingModelBody3,
    ),
  ];
}