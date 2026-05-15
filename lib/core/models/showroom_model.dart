class ShowroomModel {
  final String? showroomID;
  final String? showroomImage;
  final String? showroomName;
  final double? showroomRating;
  final String? showroomLocation;
  final String? showroomPhone;
  final String? showroomDescription;
  final List<String>? carID;

  ShowroomModel({
    this.showroomID,
    this.showroomImage,
    this.showroomName,
    this.showroomRating,
    this.showroomLocation,
    this.showroomPhone,
    this.showroomDescription,
    this.carID,
  });

  Map<String, dynamic> toMap() {
    return {
      'showroomID': showroomID,
      'showroomImage': showroomImage,
      'showroomName': showroomName,
      'showroomRating': showroomRating,
      'showroomLocation': showroomLocation,
      'showroomPhone': showroomPhone,
      'showroomDescription': showroomDescription,
      'carID': carID,
    };
  }

  factory ShowroomModel.fromMap(Map<String, dynamic> map) {
    return ShowroomModel(
        showroomID: map['showroomID'] as String?,
        showroomImage: map['showroomImage'] as String?,
        showroomName: map['showroomName'] as String?,
        showroomRating: map['showroomRating'] != null
            ? (map['showroomRating'] is double
                ? map['showroomRating'] as double
                : double.tryParse(map['showroomRating'].toString()))
            : null,
        showroomLocation: map['showroomLocation'] as String?,
        showroomPhone: map['showroomPhone'] as String?,
        showroomDescription: map['showroomDescription'] as String?,
        carID: map['carID'] != null ? List<String>.from(map['carID']) : null);
  }
}
