import 'dart:io';
import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_app_bar.dart';
import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LicenseUploadScreen extends StatefulWidget {
  const LicenseUploadScreen({super.key});

  @override
  State<LicenseUploadScreen> createState() => _LicenseUploadScreenState();
}

class _LicenseUploadScreenState extends State<LicenseUploadScreen> {
  File? _selectedImage;
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  final CarFirestoreService _firestoreService = CarFirestoreService();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 70,
      );
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, context.loc.pickImageError(e.toString()));
      }
    }
  }

  Future<void> _handleSubmit() async {
    if (_selectedImage == null) {
      if (mounted) {
        showSnackBar(context, context.loc.selectImageFirstError);
      }
      return;
    }

    setState(() => _isLoading = true);

    try {
      final String? imageUrl = await _firestoreService.uploadImageToDrive(
        _selectedImage!,
      );

      if (imageUrl != null) {
        if (mounted) {
          Navigator.pop(context, imageUrl);
        }
      } else {
        if (mounted) {
          showSnackBar(context, context.loc.uploadFailedError);
        }
      }
    } catch (e) {
      if (mounted) {
        showSnackBar(context, context.loc.errorWithDetails(e.toString()));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20),
          child: PrimaryAppBar(backIconVisible: true, text: ''),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.addVerticalSpace(20),
            Image.asset(ImagesManager.licenseVerification),
            context.addVerticalSpace(16),
            Text(
              context.loc.verifyCommercialLicenseTitle,
              style: context.titleBold18,
            ),
            context.addVerticalSpace(16),
            Text(
              context.loc.verifyCommercialLicenseDescription,
              style: context.bodyRegular,
              textAlign: TextAlign.center,
            ),
            context.addVerticalSpace(32),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.loc.uploadLicenseImageLabel,
                    style: context.inputRegular14,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            context.addVerticalSpace(4),
            GestureDetector(
              onTap: () => _showPickOptions(),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[400]!,
                    style: BorderStyle.solid,
                  ),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(_selectedImage!, fit: BoxFit.cover),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 30,
                      color: Colors.grey[600],
                    ),
                    context.addHorizontalSpace(12),
                    Text(
                      context.loc.uploadFileLabel,
                      style: context.inputRegular14,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: context.loc.verification,
              onPressed: _selectedImage != null ? _handleSubmit : null,
            ),
            context.addVerticalSpace(20),
          ],
        ).padSymmetric(20),
      ),
    );
  }

  void _showPickOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(context.loc.gallery),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(context.loc.camera),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }
}