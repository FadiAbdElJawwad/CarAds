import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  UrlLauncherService._internal();
  static final UrlLauncherService _instance = UrlLauncherService._internal();
  factory UrlLauncherService() => _instance;

  Future<void> _launchUrl(Uri url, BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(context.loc.urlLaunchError)),
      );
    }
  }

  Future<void> launchWhatsApp(BuildContext context, String phoneNumber) async {
    final cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final Uri whatsappUri = Uri.parse("https://wa.me/$cleanedPhoneNumber");
    await _launchUrl(whatsappUri, context);
  }

  Future<void> launchCall(BuildContext context, String phoneNumber) async {
    final Uri callUri = Uri.parse("tel:$phoneNumber");
    await _launchUrl(callUri, context);
  }
}