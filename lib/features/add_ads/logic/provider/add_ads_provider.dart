import 'dart:io';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddAdsProvider extends ChangeNotifier {
  final CarFirestoreService _firestoreService = CarFirestoreService();
  final NotificationService _notificationService = NotificationService();
  final ImagePicker _picker = ImagePicker();

  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController tankSizeController = TextEditingController();
  final TextEditingController gearBoxController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController doorsController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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

  void initEdit(CarCardModel car) {
    _editingCar = car;

    brandController.text = car.carName ?? '';
    modelController.text = car.carModel ?? '';
    yearController.text = car.year ?? '';
    mileageController.text = car.mileage ?? '';
    seatsController.text = car.seats ?? '';
    doorsController.text = car.doors ?? '';
    descriptionController.text = car.description ?? '';
    priceController.text = car.price ?? '';
    nameController.text = car.contactName ?? '';
    phoneController.text = car.contactPhone ?? '';

    tankSizeController.text = car.fuel ?? '';

    // Standardize dropdown values
    conditionController.text = (car.condition == null || car.condition!.isEmpty)
        ? 'New'
        : _capitalizeFirstLetter(car.condition!);

    gearBoxController.text = (car.gearType == null || car.gearType!.isEmpty)
        ? 'Automatic'
        : _capitalizeFirstLetter(car.gearType!);

    _advertisingType = (car.adType == null || car.adType!.isEmpty)
        ? 'Commercial'
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

  Future<bool> postAdvertisement(BuildContext context) async {
    if (_selectedImage == null && _editingCar == null) {
      throw Exception('Please select a vehicle image');
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
        throw Exception('Failed to upload image to Drive');
      }

      final carData = {
        'carName': brandController.text.trim(),
        'carModel': modelController.text.trim(),
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
        'seats': seatsController.text.trim(),
        'doors': doorsController.text.trim(),
        'showroomID': userId,
        'status': 'available',
      };

      if (authProvider.state.user?.role == 'showroom') {
        carData['showroomName'] =
            authProvider.state.user?.showroomName ?? 'Showroom';
      } else {
        carData['showroomName'] = 'Individual Seller';
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
                ? 'Advertisement Updated'
                : 'Advertisement Posted',
            body: _editingCar != null
                ? 'Your car advertisement for ${brandController.text.trim()} has been successfully updated.'
                : 'Your car advertisement for ${brandController.text.trim()} has been successfully posted.',
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

  void clearForm() {
    _clearForm();
  }

  void _clearForm() {
    _editingCar = null;
    brandController.clear();
    modelController.clear();
    yearController.clear();
    mileageController.clear();
    conditionController.clear();
    tankSizeController.clear();
    gearBoxController.clear();
    seatsController.clear();
    doorsController.clear();
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
    modelController.dispose();
    yearController.dispose();
    mileageController.dispose();
    conditionController.dispose();
    tankSizeController.dispose();
    gearBoxController.dispose();
    seatsController.dispose();
    doorsController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
