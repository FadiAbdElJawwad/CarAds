import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/features/explore/model/car_card_model.dart';
import 'package:car_ads/features/rental/model/checkout_order.dart';
import 'package:car_ads/features/rental/logic/service/checkout_service.dart';
import 'package:car_ads/core/services/stripe_payment_service.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/core/services/location_service.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:car_ads/core/extension/rental_date_extension.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  Position? shippingPosition;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLocationLoading = true;
  bool get isLocationLoading => _isLocationLoading;

  bool _locationFetchFailed = false;
  bool get locationFetchFailed => _locationFetchFailed;

  CheckoutProvider(this.car); 

  Future<void> fetchInitialLocation(BuildContext context) async {
    if (shippingPosition != null) return;

    _isLocationLoading = true;
    _locationFetchFailed = false;
    notifyListeners();

    try {
      Position position = await _locationService.getCurrentPosition(context);

      if (!context.mounted) return;

      String address = await _locationService.getAddressFromLatLng(
        context,
        position.latitude,
        position.longitude,
      );

      shippingPosition = position;
      shippingAddress = address;
    } catch (e) {
      AppLogger.error('Error fetching initial location', e);
      _locationFetchFailed = true;
    } finally {
      _isLocationLoading = false;
      notifyListeners();
    }
  }

  void handleMapResult(MapSelectionResult result) {
    shippingPosition = result.position;
    shippingAddress = result.address;
    _locationFetchFailed = false;
    notifyListeners();
  }

  Future<void> pickStartDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: car.showroomStartDate,
      firstDate: car.showroomStartDate,
      lastDate: car.showroomEndDate,
    );
    if (date != null) {
      rentalFromDate = date;
      notifyListeners();
    }
  }

  Future<void> pickEndDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: rentalFromDate ?? car.showroomStartDate,
      firstDate: rentalFromDate ?? car.showroomStartDate,
      lastDate: car.showroomEndDate,
    );
    if (date != null) {
      rentalUntilDate = date;
      notifyListeners();
    }
  }

  Future<void> pickStartTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (rentalFromDate != null &&
          DateUtils.isSameDay(rentalFromDate!, car.showroomStartDate)) {
        final showroomStartTime = car.parseTime(car.startTime);
        if (car.timeToMinutes(pickedTime) <
            car.timeToMinutes(showroomStartTime)) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.loc.carAvailableFromError(
                    showroomStartTime.format(context))),
              ),
            );
          }
          return;
        }
      }
      rentalFromTime = pickedTime;
      notifyListeners();
    }
  }

  Future<void> pickEndTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (rentalUntilDate != null &&
          DateUtils.isSameDay(rentalUntilDate!, car.showroomEndDate)) {
        final showroomEndTime = car.parseTime(car.endTime);
        if (car.timeToMinutes(pickedTime) >
            car.timeToMinutes(showroomEndTime)) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.loc.carReturnByError(
                    showroomEndTime.format(context))),
              ),
            );
          }
          return;
        }
      }
      rentalUntilTime = pickedTime;
      notifyListeners();
    }
  }

  Future<void> onContinue(BuildContext context) async {
    final loc = context.loc;
    if (!(formKey.currentState?.validate() ?? false)) return;

    final isRent = car.purpose == 'rent';
    if (isRent && (rentalFromDate == null || rentalUntilDate == null)) {
      return;
    }

    if (shippingAddress == null || shippingAddress!.isEmpty) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "${context.loc.shippingAddressLabel} is required",
            ),
          ),
        );
      }
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final userId = authProvider.state.user?.uid;
      final userEmail = authProvider.state.user?.email;
      final userName = authProvider.state.user?.name ?? loc.unknownUser;
      final profilePhone = authProvider.state.user?.phone;

      final carPrice = (int.tryParse(car.price ?? '0') ?? 0) * 1000;
      final totalPayment =
          carPrice + AppConstants.shippingCost + AppConstants.taxCost;

      final nationalIdValue = idController.text.trim();
      final licenseValue = licenseController.text.trim();
      final phoneValue = phoneController.text.trim().isNotEmpty
          ? phoneController.text.trim()
          : profilePhone;

      final checkoutData = CheckoutOrder(
        licenseNumber: licenseValue,
        idNumber: nationalIdValue,
        phoneNumber: phoneValue ?? '',
        rentalStart: isRent ? _checkoutService.combineDateAndTime(
          rentalFromDate!,
          rentalFromTime,
        ) : DateTime.now(),
        rentalEnd: isRent ? _checkoutService.combineDateAndTime(
          rentalUntilDate!,
          rentalUntilTime,
        ) : DateTime.now(),
        totalPayment: totalPayment,
        currency: AppConstants.currency,
        shippingCost: AppConstants.shippingCost,
        taxCost: AppConstants.taxCost,
        carName: car.carName ?? loc.unknown,
        carId: car.carId ?? '',
        carImage: car.carImage ?? '',
        carPrice: carPrice,
        userId: userId,
        userEmail: userEmail,
        location: shippingAddress ?? '',
        showroomId: car.showroomId,
        purpose: car.purpose,
      );

      final int amountInDollars = totalPayment ~/ 1000;

      AppLogger.info("Initiating Stripe payment for $amountInDollars USD");

      bool isPaymentSuccessful = await StripePaymentService().makePayment(
        context: context,
        amountInDollars: amountInDollars,
        currency: AppConstants.currency.toLowerCase(),
      );

      if (!isPaymentSuccessful) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loc.paymentFailedError),
            ),
          );
        }
        return;
      }

      final orderRef = await _checkoutService.submitCheckoutData(
        checkoutData.toMap(),
        customerName: userName,
      );

      if (userId != null) {
        await _notificationService.sendNotification(
          userId: userId,
          title: loc.rentalRequestReceivedTitle,
          body: loc.rentalRequestReceivedBody(car.carName ?? loc.unknown),
          extraData: {'bookingId': orderRef.id, 'type': 'receipt'},
        );

        if (car.showroomId != null) {
          await _notificationService.sendNotification(
            userId: car.showroomId!,
            title: loc.newRentalRequestTitle,
            body: loc.newRentalRequestShowroomBody(car.carName ?? loc.unknown),
            extraData: {'bookingId': orderRef.id, 'type': 'new_request'},
          );
        }
      }

      if (context.mounted) {
        AppRouter.goTo(
          screenName: ScreenName.confirmRentScreen,
          arguments: orderRef.id,
        );
      }
    } catch (e) {
      AppLogger.error("Checkout process failed", e);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(content: Text(loc.errorWithDetails(e.toString()))),
        );
      }
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