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
        context, // Added context as per ShowroomProvider refactoring
        widget.requestModel,
        status,
      );
      if (mounted) {
        showSnackBar(
          context,
          context.loc.requestUpdatedSuccess(status.toLowerCase()),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, context.loc.requestUpdateError(e.toString()));
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
    final bool isActionable = isPending;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.requestDetailsTitle,
        ),
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
                              widget.requestModel.isRent
                                  ? ' ${context.loc.aedPerDay}'
                                  : ' ${context.loc.aed}',
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
                            context.loc.requestByLabel,
                            widget.requestModel.customerName,
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            context.loc.requestDateLabel,
                            DateFormat(
                              'd MMM',
                            ).format(widget.requestModel.createdAt),
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            context.loc.drivingLicenseLabel,
                            widget.requestModel.driverLicenseNo ?? context.loc.notAvailable,
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            context.loc.idNumberLabel,
                            widget.requestModel.nationalId ?? context.loc.notAvailable,
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            context.loc.phoneNumberLabel,
                            widget.requestModel.phoneNumber ?? context.loc.notAvailable,
                          ),
                          context.addVerticalSpace(16),
                          _buildDetailRow(
                            context,
                            context.loc.statusLabel,
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
                        text: context.loc.acceptRequestButton,
                        onPressed: _isUpdating
                            ? null
                            : () {
                          final String purpose = widget
                              .requestModel.purpose
                              ?.toLowerCase()
                              .trim() ??
                              '';
                          final String newStatus = (purpose ==
                              'sale' ||
                              purpose == 'buy')
                              ? 'complete'
                              : 'active';
                          _updateStatus(newStatus);
                        },
                      ),
                    ),
                    context.addHorizontalSpace(16),
                    Expanded(
                      child: PrimaryButton(
                        color: ColorManager.warningColor,
                        text: context.loc.rejectRequestButton,
                        onPressed: _isUpdating
                            ? null
                            : () => _updateStatus('rejected'),
                      ),
                    ),
                  ],
                )
                    : const SizedBox.shrink(),
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
      case 'active':
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