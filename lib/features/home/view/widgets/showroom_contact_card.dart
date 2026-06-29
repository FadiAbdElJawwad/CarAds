import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/home/model/showroom_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../common/car_image_extractor.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/services/url_launcher_service.dart';

class ShowroomContactCard extends StatelessWidget {
  final String showroomName;
  final String phoneNumber;
  final String? imageUrl;
  final String? showroomID;

  const ShowroomContactCard({
    super.key,
    required this.showroomName,
    required this.phoneNumber,
    this.imageUrl,
    this.showroomID,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (showroomID != null) {
          _fetchAndNavigate(context, showroomID!);
        }
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: _buildAvatar(),
          title: Text(showroomName, style: context.bodyBold),
          subtitle: Text(
            phoneNumber,
            style: context.bodyRegular.copyWith(color: Colors.grey),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () =>
                    UrlLauncherService.launchWhatsApp(context, phoneNumber),
                icon: Image.asset(
                  ImagesManager.whatsappIcon,
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () =>
                    UrlLauncherService.launchCall(context, phoneNumber),
                icon: Image.asset(
                  ImagesManager.callIcon,
                  width: 28,
                  height: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchAndNavigate(BuildContext context, String id) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get();
      if (context.mounted) Navigator.pop(context); // hide loading

      if (doc.exists) {
        final showroom = ShowroomModel.fromMap(doc.data()!);
        AppRouter.goTo(
          screenName: ScreenName.showroomDetailsForm,
          arguments: showroom,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error fetching showroom: $e")));
      }
    }
  }

  Widget _buildAvatar() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return SizedBox(
        height: 50,
        width: 50,
        child: CarImageExtractor.buildImage(imageUrl, fit: BoxFit.contain),
      );
    }

    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.black,
      child: Text(
        showroomName.isNotEmpty ? showroomName[0].toUpperCase() : '?',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
