import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class ShowroomFieldsWidget extends StatelessWidget {
  final String selectedRole;
  final TextEditingController commercialController;
  final TextEditingController addressController;

  const ShowroomFieldsWidget({
    super.key,
    required this.selectedRole,
    required this.commercialController,
    required this.addressController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: selectedRole == 'showroom'
          ? Column(
              children: [
                PrimaryTextField(
                  controller: commercialController,
                  validator: (value) {
                    if (selectedRole == 'user') return null;
                    return value == null || value.isEmpty
                        ? 'Please enter license number'
                        : null;
                  },
                  hint: 'Commercial License Number',
                  keyboardType: TextInputType.number,
                ),
                context.addVerticalSpace(16),
                PrimaryTextField(
                  controller: addressController,
                  validator: (value) {
                    if (selectedRole == 'user') return null;
                    return value == null || value.isEmpty
                        ? 'Please enter address'
                        : null;
                  },
                  hint: 'Showroom Address',
                  keyboardType: TextInputType.streetAddress,
                ),
                context.addVerticalSpace(16),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
