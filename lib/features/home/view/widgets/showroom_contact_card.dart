import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../common/skeleton.dart';
import '../../../../core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../../common/car_image_extractor.dart';
import '../../../../core/services/url_launcher_service.dart';
import '../../logic/service/showroom_firestore_service.dart';
import '../../../../core/models/car_card_model.dart';
import '../../../../core/models/showroom_model.dart';

class ShowroomContactCard extends StatelessWidget {
  final String? showroomID;
  final CarCardModel? car;

  const ShowroomContactCard({
    super.key,
    this.showroomID,
    this.car,
  });

  @override
  Widget build(BuildContext context) {
    if (showroomID == null && car != null && car!.contactName != null) {
      return _buildIndividualSellerCard(context);
    }

    if (showroomID == null) return const SizedBox.shrink();

    final ShowroomFirestoreService showroomService = ShowroomFirestoreService();

    return StreamBuilder<QuerySnapshot>(
      stream: showroomService.getShowroomsStream(showroomID: showroomID!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShowroomContactCardSkeleton();
        }
        if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const SizedBox.shrink();
        }
        final showroomDoc = snapshot.data!.docs.first;
        final showroom =
            ShowroomModel.fromMap(showroomDoc.data() as Map<String, dynamic>);

        return InkWell(
          onTap: () {
            AppRouter.goTo(
              screenName: ScreenName.showroomDetailsForm,
              arguments: showroom,
            );
          },
          child: Card(
              child: ListTile(
            leading: SizedBox(
                height: 50,
                width: 50,
                child: CarImageExtractor.buildImage(
                  showroom.showroomImage,
                )),
            title: Text(
              showroom.showroomName ?? 'N/A',
              style: context.bodyBold,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => UrlLauncherService.launchWhatsApp(
                      context, showroom.showroomPhone ?? ''),
                  icon: Image.asset(
                    ImagesManager.whatsappIcon,
                  ),
                ),
                IconButton(
                  onPressed: () => UrlLauncherService.launchCall(
                      context, showroom.showroomPhone ?? ''),
                  icon: Image.asset(ImagesManager.callIcon),
                ),
              ],
            ),
          )),
        );
      },
    );
  }

  Widget _buildIndividualSellerCard(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Card(
        color: const Color(0xFFF8F8F8),
        child: const Icon(Icons.person, size: 30).pad(10),
      ),
      title: Text(
        car?.contactName ?? 'Individual Seller',
        style: context.bodyBold,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => UrlLauncherService.launchWhatsApp(
                context, car?.contactPhone ?? ''),
            icon: Image.asset(
              ImagesManager.whatsappIcon,
            ),
          ),
          IconButton(
            onPressed: () =>
                UrlLauncherService.launchCall(context, car?.contactPhone ?? ''),
            icon: Image.asset(ImagesManager.callIcon),
          ),
        ],
      ),
    ));
  }
}

class ShowroomContactCardSkeleton extends StatelessWidget {
  const ShowroomContactCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Skeleton(height: 50, width: 50),
        title: const Skeleton(height: 20, width: 120),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Skeleton(height: 40, width: 40, radius: 20),
            SizedBox(width: 8),
            Skeleton(height: 40, width: 40, radius: 20),
          ],
        ),
      ),
    );
  }
}
