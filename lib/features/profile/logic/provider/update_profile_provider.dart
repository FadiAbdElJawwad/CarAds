import 'dart:io';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  final ImagePicker _picker = ImagePicker();
  final NotificationService _notificationService = NotificationService();
  File? _imageFile;

  File? get imageFile => _imageFile;

  void init(String? initialName) {
    nameController = TextEditingController(text: initialName);
  }

  void disposeControllers() {
    nameController.dispose();
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  Future<void> handleUpdate(BuildContext context) async {
    final loc = context.loc;
    if (!formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();

    String? imageUrl;
    if (_imageFile != null) {
      imageUrl = await authProvider.uploadProfileImage(context, _imageFile!);
      if (imageUrl == null) {
        if (context.mounted) {
          showSnackBar(
            context,
            loc.profileImageUploadError,
          );
        }
        return;
      }
    }

    await authProvider.updateUserData(
      name: nameController.text.trim(),
      profileImage: imageUrl,
    );

    if (authProvider.state.isSuccess) {
      final userId = authProvider.state.user?.uid;
      if (userId != null) {
        await _notificationService.sendNotification(
          userId: userId,
          title: loc.profileUpdatedTitle,
          body: loc.profileUpdatedBody,
        );
      }

      if (context.mounted) {
        showSnackBar(context, loc.profileUpdatedSuccess);
        Navigator.pop(context);
      }
    } else if (authProvider.state.isFailure) {
      if (context.mounted) {
        showSnackBar(
          context,
          authProvider.state.fallbackMessage ?? loc.updateFailed,
        );
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}