import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> _launchUrl(Uri url, BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Could not launch app. Is it installed?')),
      );
    }
  }

  static Future<void> launchWhatsApp(
    BuildContext context,
    String phoneNumber,
  ) async {
    final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final Uri whatsappUri = Uri.parse("https://wa.me/$cleanedPhoneNumber");
    await _launchUrl(whatsappUri, context);
  }

  static Future<void> launchCall(
    BuildContext context,
    String phoneNumber,
  ) async {
    final Uri callUri = Uri.parse("tel:$phoneNumber");
    await _launchUrl(callUri, context);
  }
}
