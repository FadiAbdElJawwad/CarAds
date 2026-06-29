import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/common/car_image_extractor.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../common/primary_app_bar.dart';

class RequestScreen extends StatelessWidget {
  final RentRequestModel requestModel;

  const RequestScreen({super.key, required this.requestModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(backIconVisible: true, text: 'Request'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CarImageExtractor.buildImage(
                    requestModel.carImage,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(requestModel.carName, style: context.titleBold18),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      requestModel.price,
                      style: context.titleBold18.copyWith(fontSize: 16),
                    ),
                    Text(
                      ' AED/Day',
                      style: context.titleRegular18.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ).padVerticalSymmetric(16),
            ),
            context.addVerticalSpace(16),
            Card(
              child: Column(
                children: [
                  _buildDetailRow(
                    context,
                    'Request By : ',
                    requestModel.customerName,
                  ),
                  context.addVerticalSpace(16),
                  _buildDetailRow(
                    context,
                    'The date of request : ',
                    DateFormat('d MMM').format(requestModel.createdAt),
                  ),
                  context.addVerticalSpace(16),
                  _buildDetailRow(
                    context,
                    'Driving License No : ',
                    requestModel.driverLicenseNo ?? 'N/A',
                  ),
                  context.addVerticalSpace(16),
                  _buildDetailRow(
                    context,
                    'ID Number : ',
                    requestModel.nationalId ?? 'N/A',
                  ),
                  context.addVerticalSpace(16),
                  _buildDetailRow(
                    context,
                    'Phone Number : ',
                    requestModel.phoneNumber ?? 'N/A',
                  ),
                  context.addVerticalSpace(16),
                  _buildDetailRow(
                    context,
                    'Status : ',
                    requestModel.status.toUpperCase(),
                    valueColor: _getStatusColor(requestModel.status),
                  ),
                  context.addVerticalSpace(16),
                ],
              ).pad(16),
            ),
          ],
        ).padSymmetric(20),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Row(
      children: [
        Text(label, style: context.bodyRegular.copyWith(color: Colors.grey)),
        Expanded(
          child: Text(
            value,
            style: context.bodyRegular.copyWith(
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
      case 'accepted':
        return ColorManager.successColor;
      case 'pending':
        return ColorManager.alertColor;
      case 'rejected':
        return ColorManager.warningColor;
      default:
        return Colors.grey;
    }
  }
}
