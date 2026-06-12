import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/provider/map_provider.dart';
import '../widgets/location_details_card.dart';
import '../widgets/map_widget.dart';

class MapScreen extends StatelessWidget {
  final String? orderId;

  const MapScreen({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MapProvider()..fetchLocation(),
      child: Consumer<MapProvider>(
        builder: (context, model, child) {
          return Scaffold(
            bottomNavigationBar: LocationDetailsCard(
              address: model.address,
              onSetLocationPressed: () => model.onSetLocationPressed(context),
            ),
            body: model.address == "Loading Location..."
                ? const Center(child: CircularProgressIndicator())
                : MapWidget(
                    currentPosition: model.currentPosition,
                    onMapTapped: model.onMapTapped,
                  ),
          );
        },
      ),
    );
  }
}
