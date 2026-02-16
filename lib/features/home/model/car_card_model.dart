class CarCardModel {
  final String? carID;
  final String? carImage;
  final String? carName;
  final String? carModel;
  final String? price;
  final String? showroomName;
  final String? showroomID;
  final String? gearType;
  final String? carLogo;
  final String? year;
  final String? mileage;
  final String? fuel;
  final String? seats;
  final String? doors;

  CarCardModel({
    this.carID,
    this.carImage,
    this.carName,
    this.carModel,
    this.price,
    this.showroomName,
    this.showroomID,
    this.gearType,
    this.carLogo,
    this.year,
    this.mileage,
    this.fuel,
    this.seats,
    this.doors,
  });

  Map<String, dynamic> toMap() {
    return {
      'carID': carID,
      'carImage': carImage,
      'carName': carName,
      'carModel': carModel,
      'price': price,
      'showroomName': showroomName,
      'showroomID': showroomID,
      'gearType': gearType,
      'carLogo': carLogo,
      'year': year,
      'mileage': mileage,
      'fuel': fuel,
      'seats': seats,
      'doors': doors,
    };
  }

  factory CarCardModel.fromMap(Map<String, dynamic> map) {
    return CarCardModel(
      carID: map['carID'] as String?,
      carImage: map['carImage'] as String?,
      carName: map['carName'] as String?,
      carModel: map['carModel'] as String?,
      price: map['price']?.toString(),
      showroomName: map['showroomName'] as String?,
      showroomID: map['showroomID'] as String?,
      gearType: map['gearType'] as String?,
      carLogo: map['carLogo'] as String?,
      year: map['year']?.toString(),
      mileage: map['mileage']?.toString(),
      fuel: map['fuel'] as String?,
      seats: map['seats']?.toString(),
      doors: map['doors']?.toString(),
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
