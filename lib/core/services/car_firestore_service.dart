import 'dart:convert';
import 'dart:io';
import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/constant/api_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../../features/explore/logic/provider/car_ads_provider.dart';

class CarFirestoreService {
  CarFirestoreService._internal();
  static final CarFirestoreService _instance = CarFirestoreService._internal();
  factory CarFirestoreService() => _instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCarsStream({
    String? carType,
    String? showroomID,
    List<String>? carIDs,
    FilterModel? filter,
    bool onlyAvailable = true,
  }) {
    Query query = _db.collection('cars');

    if (onlyAvailable) {
      query = query.where('status', isEqualTo: 'available');
    }

    if (carIDs != null && carIDs.isNotEmpty) {
      final idsToQuery = carIDs.length > 10 ? carIDs.sublist(0, 10) : carIDs;
      query = query.where('carID', whereIn: idsToQuery);
    } else if (showroomID != null && showroomID.isNotEmpty) {
      query = query.where('showroomID', isEqualTo: showroomID);
    }

    if (carType != null && carType != 'All' && carType != 'All Cars') {
      query = query.where('carName', isEqualTo: carType);
    }

    if (filter != null) {
      if (filter.brand != 'All' &&
          filter.brand != 'All Cars' &&
          carType == null) {
        query = query.where('carName', isEqualTo: filter.brand);
      }
    }

    return query.orderBy('createdAt', descending: true).snapshots();
  }

  Future<DocumentSnapshot> getCar(String carId) {
    return _db.collection('cars').doc(carId).get();
  }

  Future<String?> uploadImageToDrive(File imageFile) async {
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      String fileName = "car_${DateTime.now().millisecondsSinceEpoch}.png";

      var response = await http.post(
        Uri.parse(ApiConstants.driveUploadUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "image": base64Image,
          "fileName": fileName,
          "mimeType": "image/png",
        }),
      );

      if (response.statusCode == 302) {
        String? redirectedUrl = response.headers['location'];
        if (redirectedUrl != null) {
          response = await http.get(Uri.parse(redirectedUrl));
        }
      }

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          return data['imageUrl'];
        }
      }
      AppLogger.error('Failed to parse successful response from Drive bridge');
      return null;
    } catch (e) {
      AppLogger.error('Drive image upload orchestration error', e);
      return null;
    }
  }

  Future<void> addCar(Map<String, dynamic> carData) async {
    final docRef = _db.collection('cars').doc();
    await docRef.set({
      ...carData,
      'carID': docRef.id,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateCar(String carID, Map<String, dynamic> carData) async {
    await _db.collection('cars').doc(carID).update(carData);
  }

  Future<void> deleteCar(String carID) async {
    await _db.collection('cars').doc(carID).delete();
  }
}
