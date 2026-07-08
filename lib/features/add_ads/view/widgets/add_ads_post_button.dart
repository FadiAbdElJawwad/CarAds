import 'package:flutter/material.dart';
import '../../../../common/primary_button.dart';
import '../../../../common/show_snack_bar.dart';
import '../../logic/provider/add_ads_provider.dart';

class AddAdsPostButton extends StatelessWidget {
  final AddAdsProvider provider;
  final GlobalKey<FormState> formKey;

  const AddAdsPostButton({
    super.key,
    required this.provider,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEditing = provider.editingCar != null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE0E0E0), width: 0.5)),
      ),
      child: PrimaryButton(
        text: isEditing ? 'SAVE CHANGES' : 'POST ADVERTISEMENT',
        onPressed: provider.isLoading
            ? null
            : () async {
                try {
                  final success = await provider.postAdvertisement(context);
                  if (success && context.mounted) {
                    showSnackBar(
                      context,
                      isEditing
                          ? 'Advertisement updated successfully!'
                          : 'Advertisement posted successfully!',
                    );
                    Navigator.pop(context);
                  }
                } catch (e) {
                  if (context.mounted) {
                    showSnackBar(context, e.toString());
                  }
                }
              },
      ),
    );
  }
}
