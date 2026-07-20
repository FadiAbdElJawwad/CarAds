import 'package:car_ads/common/sticky_bottom_button.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/features/profile/logic/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = context.read<LanguageProvider>().locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 20),
        child: PrimaryAppBar(
          backIconVisible: true,
          text: context.loc.changeLanguageTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.addVerticalSpace(20),
                Text(
                  context.loc.selectLanguageComfortable,
                  style: context.bodyRegular.copyWith(color: Colors.grey[600]),
                ),
                RadioGroup<String>(
                  groupValue: _selectedLanguage,
                  onChanged: (val) {
                    if (val != null) setState(() => _selectedLanguage = val);
                  },
                  child: Column(
                    children: [
                      _buildLanguageOption(
                        title: context.loc.english,
                        value: 'en',
                      ),
                      const Divider(color: Colors.grey),
                      _buildLanguageOption(
                        title: context.loc.arabic,
                        value: 'ar',
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ).padSymmetric(20),
          ),
        ],
      ),
      bottomNavigationBar: StickyBottomButton(
        text: context.loc.saveChanges,
        onPressed: () {
          if (_selectedLanguage != null) {
            context.read<LanguageProvider>().changeLanguage(
              _selectedLanguage!,
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildLanguageOption({required String title, required String value}) {
    return InkWell(
      onTap: () => setState(() => _selectedLanguage = value),
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Radio<String>(value: value, activeColor: Colors.black),
          Text(title, style: context.bodyRegular),
        ],
      ),
    );
  }
}