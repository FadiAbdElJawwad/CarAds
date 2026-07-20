import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/showroom/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RentRequestCard extends StatelessWidget {
  final BookingModel booking;

  const RentRequestCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left: Car Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: booking.carImage,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              placeholder: (context, url) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[200],
                child: const Icon(Icons.directions_car, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Right/Expanded: Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Car Brand and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      booking.carName,
                      style: context.bodyBold.copyWith(color: Colors.black),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${booking.pricePerDay.toInt()}${context.loc.aed}',
                            style: context.bodyBold.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          TextSpan(
                            text: booking.isRent ? context.loc.perDay : '',
                            style: context.bodyRegular.copyWith(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                context.addVerticalSpace(4),
                // Middle: Request By
                Text(
                  context.loc.requestBy(booking.requestedByName),
                  style: context.bodyRegular.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                context.addVerticalSpace(4),
                // Bottom: Date of request
                Text(
                  context.loc.requestDate(DateFormat('dd MMM').format(booking.requestDate)),
                  style: context.bodyRegular.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}