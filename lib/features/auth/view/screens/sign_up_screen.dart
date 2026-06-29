import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_button.dart';
import '../../../../common/primary_text_field.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../../common/show_snack_bar.dart';
import '../../logic/provider/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  final String? role;
  const SignUpScreen({super.key, this.role});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _commercialController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _commercialController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formState.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text;
    final role = widget.role ?? 'user';
    final commercialLicense = role == 'showroom'
        ? _commercialController.text.trim()
        : null;
    final address = role == 'showroom' ? _addressController.text.trim() : null;

    if (role == 'showroom') {
      AppRouter.goTo(
        screenName: ScreenName.verificationScreen,
        arguments: {
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'role': role,
          'commercialLicenseNumber': commercialLicense,
          'address': address,
        },
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    await authProvider.signUpUser(
      name: name,
      email: email,
      password: password,
      phone: phone,
      role: role,
    );

    if (!mounted) return;

    if (authProvider.state.isSuccess) {
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);
    } else if (authProvider.state.isFailure) {
      showSnackBar(
        context,
        authProvider.state.fallbackMessage ?? 'Something went wrong',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return ModalProgressHUD(
          inAsyncCall: authProvider.state.isLoading,
          child: Scaffold(
            body: Form(
              key: _formState,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  context.addVerticalSpace(60),
                  Image.asset(
                    ImagesManager.registration,
                    alignment: Alignment.center,
                  ),
                  context.addVerticalSpace(16),
                  Text(
                    context.loc.signUpTitle,
                    style: context.titleBold18,
                    textAlign: TextAlign.center,
                  ),
                  context.addVerticalSpace(4),
                  Text(
                    context.loc.signUpBody,
                    textAlign: TextAlign.center,
                    style: context.bodyRegular,
                  ),
                  context.addVerticalSpace(32),
                  PrimaryTextField(
                    controller: _nameController,
                    validator: (value) => value!.validateName(context),
                    hint: context.loc.name,
                    keyboardType: TextInputType.name,
                  ),
                  context.addVerticalSpace(16),
                  PrimaryTextField(
                    controller: _emailController,
                    validator: (value) => value!.validateEmail(context),
                    hint: context.loc.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  context.addVerticalSpace(16),
                  PrimaryTextField(
                    hint: 'Phone Number',
                    controller: _phoneController,
                    validator: (value) => value!.validateMobile(context),
                    keyboardType: TextInputType.phone,
                  ),
                  if (widget.role == 'showroom') ...[
                    context.addVerticalSpace(16),
                    PrimaryTextField(
                      controller: _commercialController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter license number' : null,
                      hint: 'Commercial License Number',
                      keyboardType: TextInputType.number,
                    ),
                    context.addVerticalSpace(16),
                    PrimaryTextField(
                      controller: _addressController,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter address' : null,
                      hint: 'Showroom Address',
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ],
                  context.addVerticalSpace(16),
                  PrimaryTextField(
                    controller: _passwordController,
                    validator: (value) => value!.validatePassword(context),
                    hint: context.loc.password,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  context.addVerticalSpace(24),
                  PrimaryButton(
                    text: context.loc.signUp,
                    onPressed: _handleSignUp,
                  ),
                  context.addVerticalSpace(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.loc.alreadyHaveAccount,
                        style: context.bodyRegular.copyWith(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          AppRouter.back();
                        },
                        child: Text(
                          context.loc.login,
                          style: context.bodyRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
