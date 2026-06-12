import 'package:car_ads/core/extension/text_style_extension.dart';
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
        // Top Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Last 5 Rent Request",
              style: context.bodyBold.copyWith(color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                // Navigate to See All screen
              },
              child: Text(
                "See All",
                style: context.bodyRegular.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
        // List of Requests
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
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No recent requests"),
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
