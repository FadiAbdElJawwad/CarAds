import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';
import '../../../../core/extension/app_sizes.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../logic/service/checkout_service.dart';
import '../../logic/service/location_service.dart'; // Import LocationService

class MapScreen extends StatefulWidget {
  final String orderId;
  const MapScreen({super.key, required this.orderId});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String address = "Loading Location...";
  final CheckoutService _checkoutService = CheckoutService();
  final LocationService _locationService = LocationService(); // Instantiate LocationService

  Future<void> fetchLocation() async {
    setState(() {
      address = "Loading Location...";
    });
    try {
      Position position = await _locationService.getCurrentPosition();
      String fetchedAddress = await _locationService.getAddressFromLatLng(position);
      setState(() {
        address = fetchedAddress;
      });
    } catch (e) {
      debugPrint("Error fetching location: $e");
      setState(() {
        address = "Unable to determine your location.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  Future<void> onSetLocationPressed() async {
    if (address != "Loading Location..." &&
          address != "Unable to determine your location.") {
        try {
          await _checkoutService.updateOrderLocation(
              widget.orderId, address);
          AppRouter.goTo(screenName: ScreenName.confirmRentScreen,
              arguments: widget.orderId);
        } catch (e) {
          debugPrint("Error updating location: $e");
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(
                    'Error saving location: $e')));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please wait for location to load')));
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Your Location',
                style: context.bodyRegular.copyWith(color: Colors.grey),),
              context.addVerticalSpace(8),
              Row(
                  children: [
                    Image.asset(ImagesManager.locationIcon).padEnd(4),
                    Expanded(
                      child: Text(address,
                          style: context.bodyRegular),
                    )

                  ]
              ),
              context.addVerticalSpace(18),
              PrimaryButton(
                  text: 'Set Location',
                  onPressed: onSetLocationPressed,
              )
            ],
          ).padSymmetric(20)
              .padVerticalSymmetric(24),
        ),
        body: Image.asset(
          ImagesManager.map,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        )
    );
  }
}