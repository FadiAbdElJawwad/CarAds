import 'package:car_ads/features/home/logic/service/url_formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/skeleton.dart';
import '../../../../core/constant/color_manager.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/app_sizes.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../logic/service/showroom_firestore_service.dart';
import '../../model/showroom_model.dart';

class TopRatedShowroom extends StatefulWidget {
  const TopRatedShowroom({super.key});

  @override
  State<TopRatedShowroom> createState() => _TopRatedShowroomState();
}

class _TopRatedShowroomState extends State<TopRatedShowroom> {
  final ShowroomFirestoreService _showroomService = ShowroomFirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _showroomService.getShowroomsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const TopRatedShowroomSkeleton();
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No showrooms found'));
        }

        final showroomDocs = snapshot.data!.docs;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top rated Showroom ',
              style: context.titleRegular18,
            ),
            context.addVerticalSpace(8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: showroomDocs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, i) {
                final showroomData = showroomDocs[i].data() as Map<String, dynamic>;
                final showroom = ShowroomModel.fromMap(showroomData);

                return InkWell(
                  onTap: () {
                    AppRouter.goTo(
                      screenName: ScreenName.showroomDetailsForm,
                      arguments: showroom,
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Image.network(
                              UrlFormatter.getDirectGoogleDriveUrl(showroom.showroomImage)!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Skeleton(width: double.infinity);
                              },
                            ),
                          ),
                        ),
                        context.addVerticalSpace(4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                showroom.showroomName ?? '',
                                style: context.bodyRegular,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: SvgPicture.asset(ImagesManager.share, width: 8),
                            )
                          ],
                        ),
                        context.addVerticalSpace(4),
                        Card(
                          elevation: 0,
                          color: ColorManager.ratingColor,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(showroom.showroomRating?.toString() ?? 'N/A'),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              )
                            ],
                          ).padSymmetric(8),
                        )
                      ],
                    ).pad(8),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}


class TopRatedShowroomSkeleton extends StatelessWidget {
  const TopRatedShowroomSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Skeleton(height: 25, width: 145),
        context.addVerticalSpace(8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Skeleton(width: double.infinity),
                  ),
                  context.addVerticalSpace(4),
                  Row(
                    children: [
                      const Expanded(child: Skeleton(height: 18)),
                      context.addHorizontalSpace(8),
                      const Skeleton(height: 18, width: 18, radius: 9),
                    ],
                  ),
                  context.addVerticalSpace(4),
                  const Skeleton(width: 60, height: 24),
                ],
              ).pad(8),
            );
          },
        ),
      ],
    );
  }
}
