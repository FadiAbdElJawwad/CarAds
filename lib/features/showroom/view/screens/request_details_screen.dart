import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/common/car_image_extractor.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/features/showroom/logic/provider/showroom_provider.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../common/primary_button.dart';

class RequestDetailsScreen extends StatefulWidget {
  final RentRequestModel requestModel;

  const RequestDetailsScreen({super.key, required this.requestModel});

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  bool _isUpdating = false;

  Future<void> _updateStatus(String status) async {
    setState(() => _isUpdating = true);
    try {
      await context.read<ShowroomProvider>().updateRequestStatus(
        widget.requestModel,
        status,
      );
      if (mounted) {
        showSnackBar(context, 'Request ${status.toLowerCase()} successfully');
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, 'Failed to update request: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isUpdating = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String status = widget.requestModel.status.toLowerCase();
    final bool isPending = status == 'pending';
    final bool isAccepted = status == 'accepted';
    final bool isActionable = isPending || isAccepted;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(backIconVisible: true, text: 'Request Details'),
      ),
      body: LoadingOverlay(
        isLoading: _isUpdating,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: SizedBox(
                          width: 60,
                          height: 60,
                          child: CarImageExtractor.buildImage(
                            widget.requestModel.carImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: Text(
                          widget.requestModel.carName,
                          style: context.titleBold18,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.requestModel.price,
                              style: context.titleBold18.copyWith(fontSize: 16),
                            ),
                            Text(
                              ' AED/Day',
                              style: context.titleRegular18.copyWith(
                                fontSize: 14,
                              ),
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
                            widget.requestModel.customerName,
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            'The date of request : ',
                            DateFormat(
                              'd MMM',
                            ).format(widget.requestModel.createdAt),
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            'Driving License No : ',
                            widget.requestModel.driverLicenseNo ?? 'N/A',
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            'ID Number : ',
                            widget.requestModel.nationalId ?? 'N/A',
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            'Phone Number : ',
                            widget.requestModel.phoneNumber ?? 'N/A',
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            'Status : ',
                            widget.requestModel.status.toUpperCase(),
                            valueColor: _getStatusColor(
                              widget.requestModel.status,
                            ),
                          ),
                          context.addVerticalSpace(16),
                        ],
                      ).pad(16),
                    ),
                  ],
                ).padSymmetric(20),
              ),
            ),
            if (isActionable)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: isPending
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              color: ColorManager.successColor,
                              text: 'Accept Request',
                              onPressed: _isUpdating
                                  ? null
                                  : () => _updateStatus('accepted'),
                            ),
                          ),
                          context.addHorizontalSpace(16),
                          Expanded(
                            child: PrimaryButton(
                              color: ColorManager.warningColor,
                              text: 'Reject Request',
                              onPressed: _isUpdating
                                  ? null
                                  : () => _updateStatus('rejected'),
                            ),
                          ),
                        ],
                      )
                    : PrimaryButton(
                        text: 'Complete Order',
                        onPressed: _isUpdating
                            ? null
                            : () => _updateStatus('complete'),
                      ),
              )

          ],
        ),
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
      case 'complete':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }
}
