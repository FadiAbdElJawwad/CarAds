class CarCardModel {
  final String? carId;
  final String? carImage;
  final String? carName;
  final String? carModel;
  final String? price;
  final String? showroomName;
  final String? showroomId;
  final String? gearType;
  final String? carLogo;
  final String? year;
  final String? mileage;
  final String? fuel;
  final String? seats;
  final String? doors;
  final String? contactName;
  final String? contactPhone;
  final String? description;
  final String? status;
  final String? adType;
  final String? condition;

  CarCardModel({
    this.carId,
    this.carImage,
    this.carName,
    this.carModel,
    this.price,
    this.showroomName,
    this.showroomId,
    this.gearType,
    this.carLogo,
    this.year,
    this.mileage,
    this.fuel,
    this.seats,
    this.doors,
    this.contactName,
    this.contactPhone,
    this.description,
    this.status,
    this.adType,
    this.condition,
  });

  Map<String, dynamic> toMap() {
    return {
      'carID': carId,
      'carImage': carImage,
      'carName': carName,
      'carModel': carModel,
      'price': price,
      'showroomName': showroomName,
      'showroomID': showroomId,
      'gearType': gearType,
      'carLogo': carLogo,
      'year': year,
      'mileage': mileage,
      'fuel': fuel,
      'seats': seats,
      'doors': doors,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'description': description,
      'status': status,
      'adType': adType,
      'condition': condition,
    };
  }

  factory CarCardModel.fromMap(Map<String, dynamic> map) {
    return CarCardModel(
      carId: (map['carID'] ?? map['carId']) as String?,
      carImage: map['carImage'] as String?,
      carName: map['carName'] as String?,
      carModel: map['carModel'] as String?,
      price: map['price']?.toString(),
      showroomName: map['showroomName'] as String?,
      showroomId: (map['showroomID'] ?? map['showroomId']) as String?,
      gearType: map['gearType'] as String?,
      carLogo: map['carLogo'] as String?,
      year: map['year']?.toString(),
      mileage: map['mileage']?.toString(),
      fuel: map['fuel'] as String?,
      seats: map['seats']?.toString(),
      doors: map['doors']?.toString(),
      contactName: map['contactName'] as String?,
      contactPhone: map['contactPhone'] as String?,
      description: map['description'] as String?,
      status: map['status'] as String?,
      adType: map['adType'] as String?,
      condition: map['condition'] as String?,
    );
  }
}
