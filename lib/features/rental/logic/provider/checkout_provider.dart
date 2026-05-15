import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/models/car_card_model.dart';
import 'package:car_ads/features/rental/model/checkout_order.dart';
import 'package:car_ads/features/rental/logic/service/checkout_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/core/services/location_service.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class CheckoutProvider with ChangeNotifier {
  final CarCardModel car;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController licenseController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final CheckoutService _checkoutService = CheckoutService();
  final NotificationService _notificationService = NotificationService();
  final LocationService _locationService = LocationService();

  DateTime? rentalFromDate;
  TimeOfDay? rentalFromTime;
  DateTime? rentalUntilDate;
  TimeOfDay? rentalUntilTime;
  String? shippingAddress;
  LatLng? shippingPosition;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLocationLoading = true;
  bool get isLocationLoading => _isLocationLoading;

  bool _locationFetchFailed = false;
  bool get locationFetchFailed => _locationFetchFailed;

  CheckoutProvider(this.car) {
    fetchInitialLocation();
  }

  Future<void> fetchInitialLocation() async {
    _isLocationLoading = true;
    _locationFetchFailed = false;
    notifyListeners();

    try {
      final position = await _locationService.getCurrentPosition();
      final address = await _locationService.getAddressFromLatLng(
          position.latitude, position.longitude);
      shippingAddress = address;
      shippingPosition = LatLng(position.latitude, position.longitude);
    } catch (e) {
      AppLogger.error('Error fetching initial location', e);
      _locationFetchFailed = true;
    }

    _isLocationLoading = false;
    notifyListeners();
  }

  void handleMapResult(MapSelectionResult result) {
    shippingAddress = result.address;
    shippingPosition = result.position;
    _locationFetchFailed = false;
    notifyListeners();
  }

  Future<void> pickDate(BuildContext context, bool isStart) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null) return;

    if (isStart) {
      rentalFromDate = date;
    } else {
      rentalUntilDate = date;
    }
    notifyListeners();
  }

  Future<void> pickTime(BuildContext context, bool isStart) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    if (isStart) {
      rentalFromTime = time;
    } else {
      rentalUntilTime = time;
    }
    notifyListeners();
  }

  Future<void> onContinue(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (rentalFromDate == null || rentalUntilDate == null) return;
    if (shippingAddress == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.state.user?.uid;
      final userEmail = authProvider.state.user?.email;

      final carPrice = (int.tryParse(car.price ?? '0') ?? 0) * 1000;
      final totalPayment = carPrice + AppConstants.shippingCost + AppConstants.taxCost;

      final checkoutData = CheckoutOrder(
        licenseNumber: licenseController.text,
        idNumber: idController.text,
        phoneNumber: phoneController.text,
        rentalStart: _checkoutService.combineDateAndTime(rentalFromDate!, rentalFromTime),
        rentalEnd: _checkoutService.combineDateAndTime(rentalUntilDate!, rentalUntilTime),
        totalPayment: totalPayment,
        currency: AppConstants.currency,
        shippingCost: AppConstants.shippingCost,
        taxCost: AppConstants.taxCost,
        carName: car.carName ?? 'Unknown',
        carImage: car.carImage ?? '',
        carPrice: carPrice,
        userId: userId,
        userEmail: userEmail,
        location: shippingAddress,
      );

      // 1. Save order to Firestore
      final orderRef = await _checkoutService.submitCheckoutData(checkoutData.toMap());

      // 2. Dual Action Notification (Firestore + FCM)
      if (userId != null) {
        await _notificationService.sendNotification(
          userId: userId,
          title: 'Rental Request Received',
          body: 'Your rental request for ${car.carName} has been successfully submitted.',
        );
      }

      AppRouter.goTo(screenName: ScreenName.confirmRentScreen, arguments: orderRef.id);
    } catch (e) {
      AppLogger.error("Order submission failed", e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    licenseController.dispose();
    idController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
