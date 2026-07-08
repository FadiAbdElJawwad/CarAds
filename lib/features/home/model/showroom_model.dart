class ShowroomModel {
  final String? showroomId;
  final String? showroomImage;
  final String? showroomName;
  final double? showroomRating;
  final String? showroomLocation;
  final String? showroomPhone;
  final String? showroomDescription;
  final String? address;
  final List<String>? carId;

  ShowroomModel({
    this.showroomId,
    this.showroomImage,
    this.showroomName,
    this.showroomRating,
    this.showroomLocation,
    this.showroomPhone,
    this.showroomDescription,
    this.address,
    this.carId,
  });

  Map<String, dynamic> toMap() {
    return {
      'showroomID': showroomId,
      'showroomImage': showroomImage,
      'showroomName': showroomName,
      'showroomRating': showroomRating,
      'showroomLocation': showroomLocation,
      'showroomPhone': showroomPhone,
      'showroomDescription': showroomDescription,
      'address': address,
      'carID': carId,
    };
  }

  factory ShowroomModel.fromMap(Map<String, dynamic> map) {
    return ShowroomModel(
      showroomId:
          (map['showroomID'] ?? map['uid'] ?? map['showroomId']) as String?,
      showroomImage:
          (map['showroomImage'] ??
                  map['profileImage'] ??
                  map['licenseImageUrl'])
              as String?,
      showroomName: (map['showroomName'] ?? map['name']) as String?,
      showroomRating: map['showroomRating'] != null
          ? (map['showroomRating'] is double
                ? map['showroomRating'] as double
                : double.tryParse(map['showroomRating'].toString()))
          : null,
      showroomLocation: map['showroomLocation'] as String?,
      showroomPhone: (map['showroomPhone'] ?? map['phone']) as String?,
      showroomDescription: map['showroomDescription'] as String?,
      address: map['address'] as String?,
      carId: map['carID'] != null
          ? List<String>.from(map['carID'])
          : (map['carId'] != null ? List<String>.from(map['carId']) : null),
    );
  }
}
