import 'package:flutter/material.dart';
import '../service/url_formatter.dart';

class CarImageExtractor {

  static Widget buildImage(String? imagePath) {
    final directUrl = UrlFormatter.getDirectGoogleDriveUrl(imagePath);
    if (directUrl == null || directUrl.isEmpty) {
      return const SizedBox(height: 100);
    }

    if (directUrl.startsWith('http')) {
      return Image.network(
        directUrl,
        height: 100,
        width: double.infinity,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
        const SizedBox(height: 100, child: Icon(Icons.error)),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      );
    } else {
      return Image.asset(
        directUrl,
        height: 100,
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
      return Image.network(
        directUrl,
        fit: BoxFit.cover,
        height: 24,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.business),
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