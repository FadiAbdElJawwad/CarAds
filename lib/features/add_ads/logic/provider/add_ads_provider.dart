import 'dart:io';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/core/extension/app_sizes.dart'; // Import for context.loc
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddAdsProvider extends ChangeNotifier {
  final CarFirestoreService _firestoreService = CarFirestoreService();
  final NotificationService _notificationService = NotificationService();
  final ImagePicker _picker = ImagePicker();

  CarCardModel? _editingCar;
  CarCardModel? get editingCar => _editingCar;

  String _advertisingType = 'Commercial';
  String get advertisingType => _advertisingType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  void setAdvertisingType(String type) {
    _advertisingType = type;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void initEdit(BuildContext context, CarCardModel car) {
    _editingCar = car;
    _advertisingType = (car.adType == null || car.adType!.isEmpty)
        ? context.loc.commercial
        : _capitalizeFirstLetter(car.adType!);
    _selectedImage = null;
    notifyListeners();
  }

  String _capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<bool> postAdvertisement({
    required BuildContext context,
    required Map<String, String> carDetails,
  }) async {
    if (_selectedImage == null && _editingCar == null) {
      throw Exception(context.loc.selectVehicleImageError);
    }

    _setLoading(true);
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.state.user?.uid;

      String? driveImageUrl = _editingCar?.carImage;

      if (_selectedImage != null) {
        driveImageUrl = await _firestoreService.uploadImageToDrive(
          _selectedImage!,
        );
      }

      if (driveImageUrl == null) {
        throw Exception(context.loc.uploadImageError);
      }

      final Map<String, dynamic> carData = {
        'carName': carDetails['brand'] ?? '',
        'carModel': carDetails['model'] ?? '',
        'year': carDetails['year'] ?? '',
        'mileage': carDetails['mileage'] ?? '',
        'condition': carDetails['condition'] ?? '',
        'tankSize': carDetails['tankSize'] ?? '',
        'gearType': carDetails['gearType'] ?? '',
        'description': carDetails['description'] ?? '',
        'price': carDetails['price'] ?? '',
        'contactName': carDetails['name'] ?? '',
        'contactPhone': carDetails['phone'] ?? '',
        'adType': _advertisingType,
        'carImage': driveImageUrl,
        'fuel': carDetails['tankSize'] ?? '',
        'seats': carDetails['seats'] ?? '',
        'doors': carDetails['doors'] ?? '',
        'showroomID': userId,
        'status': 'available',
        'purpose': carDetails['purpose'] ?? 'sale',
      };

      if (carDetails['purpose'] == 'rent') {
        carData['startDate'] = carDetails['startDate'] ?? '';
        carData['startTime'] = carDetails['startTime'] ?? '';
        carData['endDate'] = carDetails['endDate'] ?? '';
        carData['endTime'] = carDetails['endTime'] ?? '';
      }

      if (authProvider.state.user?.role == 'showroom') {
        carData['showroomName'] =
            authProvider.state.user?.showroomName ?? context.loc.showroomDefaultName;
      } else {
        carData['showroomName'] = context.loc.individualSellerLabel;
      }

      if (_editingCar != null) {
        await _firestoreService.updateCar(_editingCar!.carId!, carData);
      } else {
        await _firestoreService.addCar(carData);
      }

      if (context.mounted) {
        final authProviderMounted = Provider.of<AuthProvider>(
          context,
          listen: false,
        );
        final userIdMounted = authProviderMounted.state.user?.uid;
        if (userIdMounted != null) {
          await _notificationService.sendNotification(
            userId: userIdMounted,
            title: _editingCar != null
                ? context.loc.adUpdatedTitle
                : context.loc.adPostedTitle,
            body: _editingCar != null
                ? context.loc.adUpdatedBody(carDetails['brand'] ?? '')
                : context.loc.adPostedBody(carDetails['brand'] ?? ''),
          );
        }
      }

      _editingCar = null;
      _selectedImage = null;
      _advertisingType = context.loc.commercial;
      notifyListeners();

      return true;
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }
}