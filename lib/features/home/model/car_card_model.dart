
class CarCardModel {
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

  factory CarCardModel.fromMap(Map<String, dynamic> map) {
    return CarCardModel(
      carImage: map['carImage'] as String?,
      carName: map['carName'] as String?,
      price: map['price'] != null
          ? (map['price'] is int ? map['price'] as int : int.tryParse(map['price'].toString()))
          : null,
      showroomName: map['showroomName'] as String?,
      gearType: map['gearType'] as String?,
      carLogo: map['carLogo'] as String?,
      fuel: map['fuel'] as String?,
      seats: map['seats'] as String?,
      doors: map['doors'] as String?,
      year: map['year']?.toString() ?? '',
      mileage: map['mileage']?.toString() ?? '',
    );

  }

//
//   Map<String, dynamic> toMap() {
//     return {
//       'carImage': carImage,
//       'carName': carName,
//       'price': price,
//       'showroomName': showroomName,
//       'gearType': gearType,
//       'carLogo': carLogo,
//       'fuel': fuel,
//       'seats': seats,
//       'doors': doors,
//       'year': year,
//       'mileage': mileage,
//     };
//   }
// }
//
// List<CarCardModel> carCardList(BuildContext context) {
//   return [
//     CarCardModel(
//         carImage: ImagesManager.toyota,
//         carName: 'Toyota',
//         price: 16,
//         showroomName: 'Showroom Name',
//         gearType: 'Automatic',
//         carLogo: ImagesManager.toyotaLogo,
//         fuel: '63 Liters',
//         seats: '4 ',
//         doors: '4 ',
//         year: '2023',
//         mileage: '15,000 km'
//     ),
//     CarCardModel(
//         carImage: ImagesManager.audi,
//         carName: 'Audi',
//         price: 16,
//         showroomName: 'Showroom Name',
//         gearType: 'Automatic',
//         carLogo: ImagesManager.audiLogo,
//         fuel: '63 Liters',
//         seats: '4 ',
//         doors: '4 ',
//         year: '2023',
//         mileage: '15,000 km'
//     ),
//     CarCardModel(
//         carImage: ImagesManager.mazda,
//         carName: 'Mazda',
//         price: 16,
//         showroomName: 'Showroom Name',
//         gearType: 'Automatic',
//         carLogo: ImagesManager.mazdaLogo,
//         fuel: '63 Liters',
//         seats: '4 ',
//         doors: '4 ',
//         year: '2023',
//         mileage: '15,000 km'
//     ),
//     CarCardModel(
//         carImage: ImagesManager.hyundai,
//         carName: 'Hyundai',
//         price: 16,
//         showroomName: 'Showroom Name',
//         gearType: 'Automatic',
//         carLogo: ImagesManager.hyundaiLogo,
//         fuel: '63 Liters',
//         seats: '4 ',
//         doors: '4 ',
//         year: '2023',
//         mileage: '15,000 km'
//     ),
//   ];
}
