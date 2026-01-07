import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';

class HomeModel {
  HomeModel({this.image  , this.model, this.price, this.gear, this.seats, this.fuel, this.rent});
  final String? image;
  final String? model;
  final int? price;
  final String? gear;
  final String? seats;
  final String? fuel;
  final String? rent;

}

List<HomeModel>homeList(BuildContext context) {
  return [
    HomeModel(
      image: ImagesManager.toyota,
      model: 'Toyota',
      price: 16000,
      gear: 'Automatic',
      seats: '4 seats',
      fuel: 'Diesel',
      rent: ''
    ),
    HomeModel(
      image: ImagesManager.hyundai,
      model: 'Hyundai',
      price: 19000,
      gear: 'Automatic',
      seats: '4 seats',
      fuel: 'Diesel',
      rent: ''
    ),
    HomeModel(
      image: ImagesManager.mazda,
      model: 'Mazda',
      price: 2000,
      gear: 'Automatic',
      seats: '4 seats',
      fuel: 'Diesel',
      rent: '/Day'
    ),
    HomeModel(
      image: ImagesManager.mercedesBenz,
      model: 'Mercedes Benz',
      price: 2000,
      gear: 'Automatic',
      seats: '4 seats',
      fuel: 'Diesel',
      rent: '/Day'

    ),
    HomeModel(
      image: ImagesManager.audi,
      model: 'Audi',
      price: 2000,
      gear: 'Automatic',
      seats: '4 seats',
      fuel: 'Diesel',
      rent: '/Day'

    ),

  ];
}