import 'package:flutter/material.dart';
import 'network_custom_image_widget.dart';
import '../features/home/logic/service/url_formatter.dart';

class CarImageExtractor {

  static Widget buildImage(String? imagePath, {double height = 100, BoxFit fit = BoxFit.cover}) {
    final directUrl = UrlFormatter.getDirectGoogleDriveUrl(imagePath);
    if (directUrl == null || directUrl.isEmpty) {
      return SizedBox(height: height);
    }

    if (directUrl.startsWith('http')) {
      return NetworkCustomImageWidget(
        imageUrl: directUrl,
        height: height,
        width: double.infinity,
        fit: fit,
      );
    } else {
      return Image.asset(
        directUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.contain,
      );
    }
  }

  static Widget buildLogo(String? logoPath) {
    final directUrl = UrlFormatter.getDirectGoogleDriveUrl(logoPath);
    if (directUrl == null || directUrl.isEmpty) {
      return const SizedBox();
    }

    if (directUrl.startsWith('http')) {
      return NetworkCustomImageWidget(
        imageUrl: directUrl,
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        directUrl,
        fit: BoxFit.cover,
        height: 24,
      );
    }
  }
}
