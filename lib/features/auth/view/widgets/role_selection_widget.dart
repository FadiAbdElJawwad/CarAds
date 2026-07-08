import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class RoleSelectionWidget extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<String?> onRoleChanged;

  const RoleSelectionWidget({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: RadioListTile<String>(
              activeColor: Colors.black,
              title: Text('User', style: context.bodyRegular),
              value: 'user',
              groupValue: selectedRole,
              onChanged: onRoleChanged,
              contentPadding: EdgeInsets.zero,
              dense: true,
            ),
          ),
          Expanded(
            child: RadioListTile<String>(
              activeColor: Colors.black,
              title: Text('Showroom', style: context.bodyRegular),
              value: 'showroom',
              groupValue: selectedRole,
              onChanged: onRoleChanged,
              contentPadding: EdgeInsets.zero,
              dense: true,
            ),
          ),
        ],
      ),
    );
  }
}
