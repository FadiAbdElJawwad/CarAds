import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../common/skeleton.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../../common/car_image_extractor.dart';
import '../../logic/service/showroom_firestore_service.dart';
import '../../model/showroom_model.dart';

class ShowroomContactCard extends StatelessWidget {
  final String showroomID;
  const ShowroomContactCard({super.key, required this.showroomID});

  @override
  Widget build(BuildContext context) {
    final ShowroomFirestoreService showroomService = ShowroomFirestoreService();

    return StreamBuilder<QuerySnapshot>(
      stream: showroomService.getShowroomsStream(showroomID: showroomID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShowroomContactCardSkeleton();
        }
        if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.docs.isEmpty) {
          return const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Showroom information not available.'),
              ));
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
              child:
              ListTile(
                leading:  SizedBox(
                    height: 50,width: 50,
                    child: CarImageExtractor.buildImage(showroom.showroomImage,)
                ),
                title: Text(showroom.showroomName ?? 'N/A',style: context.bodyBold,),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){},
                      icon: Image.asset(ImagesManager.whatsappIcon,),
                    ),
                    IconButton(onPressed: (){},
                      icon: Image.asset(ImagesManager.callIcon),
                    ),
                  ],
                ),

              )
          ),
        );
      },
    );
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
