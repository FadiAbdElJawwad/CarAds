import 'package:car_ads/core/constant/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../logic/provider/map_provider.dart';
import '../widgets/location_details_card.dart';

class MapScreen extends StatefulWidget {
  final String? orderId;

  const MapScreen({super.key, this.orderId});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapProvider(),
      child: Consumer<MapProvider>(
        builder: (context, model, child) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                kToolbarHeight + MediaQuery.of(context).padding.top,
              ),
              child: PrimaryAppBar(
                backIconVisible: true,
                text: '',
              ),
            ),
            bottomNavigationBar: LocationDetailsCard(
              address: model.address,
              onSetLocationPressed: () => model.onSetLocationPressed(context),
            ),
            body: model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox.expand(
                    child: Image.asset(
                      ImagesManager.map,
                      fit: BoxFit.cover,
                    ),
                  ),
          );
        },
      ),
    );
  }
}