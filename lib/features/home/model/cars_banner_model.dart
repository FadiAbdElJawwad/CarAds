import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';

class CarsBannerModel {
  CarsBannerModel({this.image  , this.model, this.price, this.gear, this.seats, this.fuel, this.rent, this.fuelType, this.year, this.mileage, this.doors});
  final String? image;
  final String? model;
  final int? price;
  final String? gear;
  final String? seats;
  final String? doors;
  final String? fuel;
  final String? fuelType;
  final String? rent;
  final String? year;
  final String? mileage;

}

List<CarsBannerModel>carsBannerList(BuildContext context) {
  return [
    CarsBannerModel(
      image: ImagesManager.toyota,
      model: 'Toyota',
      price: 16000,
      gear: 'Automatic',
      seats: '4',
      doors: '4',
      fuelType: 'Diesel',
      fuel: '63 Liters',
      rent: '',
      year: '2023',
      mileage: '15,000 km'
    ),
    CarsBannerModel(
      image: ImagesManager.hyundai,
      model: 'Hyundai',
      price: 19000,
      gear: 'Automatic',
      seats: '4',
      doors: '4',
      fuelType: 'Diesel',
      fuel: '63 Liters',
      rent: '',
      year: '2023',
      mileage: '15,000 km'
    ),
    CarsBannerModel(
      image: ImagesManager.mazda,
      model: 'Mazda',
      price: 2000,
      gear: 'Automatic',
      seats: '4',
      doors: '4',
      fuelType: 'Diesel',
      fuel: '63 Liters',
      rent: '/Day',
      year: '2023',
      mileage: '15,000 km'
    ),
    CarsBannerModel(
      image: ImagesManager.mercedesBenz,
      model: 'Mercedes Benz',
      price: 2000,
      gear: 'Automatic',
      seats: '4',
      doors: '4',
      fuelType: 'Diesel',
      fuel: '63 Liters',
      rent: '/Day',
      year: '2023',
      mileage: '15,000 km'

    ),
    CarsBannerModel(
      image: ImagesManager.audi,
      model: 'Audi',
      price: 2000,
      gear: 'Automatic',
      seats: '4',
      doors: '4',
      fuelType: 'Diesel',
      fuel: '63 Liters',
      rent: '/Day',
      year: '2023',
      mileage: '15,000 km'
    ),

  ];
}