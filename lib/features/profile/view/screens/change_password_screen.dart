import 'package:car_ads/common/loading_overlay.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_app_bar.dart';
import '../../../../common/primary_button.dart';
import '../../../../core/extension/string_validation.dart';
import '../../logic/provider/change_password_provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late final ChangePasswordProvider _changePasswordProvider;

  @override
  void initState() {
    super.initState();
    _changePasswordProvider = ChangePasswordProvider();
  }

  @override
  void dispose() {
    _updatePasswordProviderState();
    super.dispose();
  }

  void _updatePasswordProviderState() {
    _changePasswordProvider.disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _changePasswordProvider,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 20),
          child: PrimaryAppBar(
            backIconVisible: true,
            text: 'Reset Your Password ',
          ),
        ),
        body: Consumer<ChangePasswordProvider>(
          builder: (context, provider, _) {
            return LoadingOverlay(
              isLoading: provider.isLoading,
              child: Form(
                key: provider.formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          context.addVerticalSpace(20),
                          _buildPasswordField(
                            controller: provider.currentPasswordController,
                            hint: 'Current password',
                            validator: (value) {
                              if (provider.currentPasswordError != null) {
                                return provider.currentPasswordError;
                              }
                              return value!.validatePassword(context);
                            },
                          ),
                          context.addVerticalSpace(24),
                          const Divider(color: Colors.grey),
                          context.addVerticalSpace(24),
                          _buildPasswordField(
                            controller: provider.newPasswordController,
                            hint: 'New Password',
                            validator: (value) => value!.validateNewPassword(
                              context,
                              provider.currentPasswordController.text,
                            ),
                          ),
                          context.addVerticalSpace(24),
                          _buildPasswordField(
                            controller: provider.confirmPasswordController,
                            hint: 'Confirm Password',
                            validator: (value) =>
                                value!.validateConfirmPassword(
                                  context,
                                  provider.newPasswordController.text,
                                ),
                          ),
                        ],
                      ).padSymmetric(20),
                    ),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(color: Colors.white),
                      child: PrimaryButton(
                        text: 'Reset Your Password',
                        onPressed: provider.isLoading
                            ? null
                            : () => provider.handleChangePassword(context),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
  }) {
    return PrimaryTextField(
      controller: controller,
      hint: hint,
      obscureText: true,
      validator: validator,
    );
  }
}
