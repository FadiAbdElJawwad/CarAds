import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/rental/logic/provider/checkout_provider.dart';
import 'package:car_ads/features/home/model/map_selection_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWidget extends StatelessWidget {
  final CheckoutProvider model;

  const LocationWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if (model.isLocationLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (model.locationFetchFailed || model.shippingPosition == null) {
      return InkWell(
        onTap: () async {
          final result =
          await Navigator.of(context).pushNamed(ScreenName.mapScreen);
          if (result is MapSelectionResult) {
            model.handleMapResult(result);
          }
        },
        child: Image.asset(ImagesManager.map,
            height: 150, width: double.infinity, fit: BoxFit.cover),
      );
    }
    return GoogleMap(
      key: ValueKey(model.shippingPosition),
      initialCameraPosition: CameraPosition(
        target: model.shippingPosition!,
        zoom: 14.0,
      ),
      markers: {
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: model.shippingPosition!,
        )
      },
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      scrollGesturesEnabled: false,
      onTap: (LatLng position) async {
        final result =
        await Navigator.of(context).pushNamed(ScreenName.mapScreen);
        if (result is MapSelectionResult) {
          model.handleMapResult(result);
        }
      },
    );
  }
}
