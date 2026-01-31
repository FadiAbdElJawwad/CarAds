import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';

class TopRatedShowroomModel {
  TopRatedShowroomModel({this.image , this.showroomName, this.rating, });
  final String? image;
  final String? showroomName;
  final double? rating;
}

List<TopRatedShowroomModel>topRatedShowroomList(BuildContext context) {
  return [
    TopRatedShowroomModel(
        image: ImagesManager.showroom,
        showroomName: 'Showroom Name',
        rating: 4.5,
    ),
    TopRatedShowroomModel(
        image: ImagesManager.showroom,
        showroomName: 'Showroom Name',
        rating: 4.5,
    ),
    TopRatedShowroomModel(
        image: ImagesManager.showroom,
        showroomName: 'Showroom Name',
        rating: 4.5,
    ),
    TopRatedShowroomModel(
        image: ImagesManager.showroom,
        showroomName: 'Showroom Name',
        rating: 4.5,
    ),


  ];
}