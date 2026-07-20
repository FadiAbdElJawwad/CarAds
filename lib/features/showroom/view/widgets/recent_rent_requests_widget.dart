import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/showroom/logic/provider/showroom_provider.dart';
import 'package:car_ads/features/showroom/view/widgets/rent_request_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentRentRequestsWidget extends StatelessWidget {
  const RecentRentRequestsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.last5RentRequests,
              style: context.bodyBold.copyWith(color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                AppRouter.goTo(
                  screenName: ScreenName.requestsScreen,
                  arguments: true,
                );
              },
              child: Text(
                context.loc.seeAll,
                style: context.bodyRegular.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
        Consumer<ShowroomProvider>(
          builder: (context, showroomProvider, child) {
            if (showroomProvider.isLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (showroomProvider.recentBookings.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(context.loc.noRecentRequests),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: showroomProvider.recentBookings.length,
              itemBuilder: (context, index) {
                final booking = showroomProvider.recentBookings[index];
                return RentRequestCard(booking: booking);
              },
            );
          },
        ),
      ],
    );
  }
}