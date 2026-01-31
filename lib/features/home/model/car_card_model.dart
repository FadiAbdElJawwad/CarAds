import '../../../core/constant/images_manager.dart';
import 'package:flutter/material.dart';

class CarCardModel {
  CarCardModel({
    this.carImage,
    this.carName,
    this.price,
    this.showroomName,
    this.gearType,
    this.carLogo,
    this.fuel,
    this.seats,
    this.doors,
    required this.year,
    required this.mileage,
  });
  final String? carImage;
  final String? carName;
  final int? price;
  final String? showroomName;
  final String? gearType;
  final String? carLogo;
  final String? fuel;
  final String? seats;
  final String? doors;
  final String year;
  final String mileage;
}

List<CarCardModel> carCardList(BuildContext context) {
  return [
    CarCardModel(
        carImage: ImagesManager.toyota,
        carName: 'Toyota',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.toyotaLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
    CarCardModel(
        carImage: ImagesManager.audi,
        carName: 'Audi',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.audiLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
    CarCardModel(
        carImage: ImagesManager.mazda,
        carName: 'Mazda',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.mazdaLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
    CarCardModel(
        carImage: ImagesManager.hyundai,
        carName: 'Hyundai',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.hyundaiLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
    CarCardModel(
        carImage: ImagesManager.mazda,
        carName: 'Mazda',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.mazdaLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
    CarCardModel(
        carImage: ImagesManager.hyundai,
        carName: 'Hyundai',
        price: 16,
        showroomName: 'Showroom Name',
        gearType: 'Automatic',
        carLogo: ImagesManager.hyundaiLogo,
        fuel: '63 Liters',
        seats: '4 ',
        doors: '4 ',
        year: '2023',
        mileage: '15,000 km'
    ),
  ];
}
