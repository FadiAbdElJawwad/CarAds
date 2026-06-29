import 'dart:io';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/// [AddAdsProvider] manages the state and business logic for posting new car advertisements.
/// It handles image picking, form validation, and data submission to Drive and Firestore.
class AddAdsProvider extends ChangeNotifier {
  final CarFirestoreService _firestoreService = CarFirestoreService();
  final NotificationService _notificationService = NotificationService();
  final ImagePicker _picker = ImagePicker();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController tankSizeController = TextEditingController();
  final TextEditingController gearBoxController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _selectedImage = File(image.path);
      notifyListeners();
    }
  }

  Future<bool> postAdvertisement(BuildContext context) async {
    if (!formKey.currentState!.validate()) return false;

    if (_selectedImage == null) {
      throw Exception('Please select a vehicle image');
    }

    _setLoading(true);
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.state.user?.uid;

      // 1. Upload to Drive
      String? driveImageUrl = await _firestoreService.uploadImageToDrive(
        _selectedImage!,
      );

      if (driveImageUrl == null) {
        throw Exception('Failed to upload image to Drive');
      }

      final carData = {
        'carName': brandController.text.trim(),
        'year': yearController.text.trim(),
        'mileage': mileageController.text.trim(),
        'condition': conditionController.text.trim(),
        'tankSize': tankSizeController.text.trim(),
        'gearType': gearBoxController.text.trim(),
        'description': descriptionController.text.trim(),
        'price': priceController.text.trim(),
        'contactName': nameController.text.trim(),
        'contactPhone': phoneController.text.trim(),
        'adType': _advertisingType,
        'carImage': driveImageUrl,
        'fuel': tankSizeController.text.trim(),
        'seats': '5',
        'doors': '4',
        'showroomID': userId,
        'status': 'available',
        'createdAt': FieldValue.serverTimestamp(),
      };

      if (authProvider.state.user?.role == 'showroom') {
        carData['showroomName'] =
            authProvider.state.user?.showroomName ?? 'Showroom';
      } else {
        carData['showroomName'] = 'Individual Seller';
      }

      await _firestoreService.addCar(carData);

      if (context.mounted) {
        final authProviderMounted = Provider.of<AuthProvider>(
          context,
          listen: false,
        );
        final userIdMounted = authProviderMounted.state.user?.uid;
        if (userIdMounted != null) {
          await _notificationService.sendNotification(
            userId: userIdMounted,
            title: 'Advertisement Posted',
            body:
                'Your car advertisement for ${brandController.text.trim()} has been successfully posted.',
          );
        }
      }

      _clearForm();
      return true;
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _clearForm() {
    brandController.clear();
    yearController.clear();
    mileageController.clear();
    conditionController.clear();
    tankSizeController.clear();
    gearBoxController.clear();
    descriptionController.clear();
    priceController.clear();
    nameController.clear();
    phoneController.clear();
    _selectedImage = null;
    _advertisingType = 'Commercial';
    notifyListeners();
  }

  @override
  void dispose() {
    brandController.dispose();
    yearController.dispose();
    mileageController.dispose();
    conditionController.dispose();
    tankSizeController.dispose();
    gearBoxController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
