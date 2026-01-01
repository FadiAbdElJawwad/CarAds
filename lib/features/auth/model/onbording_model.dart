import '../../../core/constant/images_manager.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

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
      title: S
          .of(context)
          .onbordingModelTitle1,
      body: S
          .of(context)
          .onbordingModelBody1,

    ),
    OnbordingModel(
      image: ImagesManager.onbording_2,
      title: S
          .of(context)
          .onbordingModelTitle2,
      body: S
          .of(context)
          .onbordingModelBody2,
    ),
    OnbordingModel(
      image: ImagesManager.onbording_3,
      title: S
          .of(context)
          .onbordingModelTitle3,
      body: S
          .of(context)
          .onbordingModelBody3,
    ),
  ];
}