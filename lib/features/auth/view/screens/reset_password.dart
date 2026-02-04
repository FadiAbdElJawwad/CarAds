import 'package:car_ads/common/primary_button.dart';
import 'package:car_ads/common/primary_text_field.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/show_snack_bar.dart' ;
import '../../../../core/extension/responsive_layout_extension.dart';
import '../../../../core/extension/string_validation.dart';
import '../../logic/helper/auth_error_messages.dart';
import '../../logic/provider/auth_provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.addListener(_resetPasswordListener);
  }

  void _resetPasswordListener() {
    if (!mounted) return;
    final state = authProvider.state;
    if (state.isSuccess || state.isFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (state.isSuccess) {
          showSnackBar(context, 'Password reset email sent successfully!');
          AppRouter.goTo(screenName: ScreenName.login);
        } else if (state.isFailure) {
          final errorMessage = AuthErrorMessages.getErrorMessage(context, state.errorKey ?? '');
          showSnackBar(context, errorMessage);
        }
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    authProvider.removeListener(_resetPasswordListener);
    authProvider.resetState();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (formState.currentState?.validate() ?? false) {
      await authProvider.resetPassword(email: emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return ModalProgressHUD(
          inAsyncCall: provider.state.isLoading,
          child: Scaffold(
            body: SafeArea(
              child: Form(
                key: formState,
                child: Column(
                  children: [
                    context.addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () => AppRouter.back(),
                            icon: SvgPicture.asset(ImagesManager.arrowLeft),
                          ),
                        )
                      ],
                    ),
                    context.addVerticalSpace(40),
                    Image.asset(ImagesManager.resetPassword),
                    context.addVerticalSpace(16),
                    Text(context.loc.forgotPassword, style: context.titleBold18),
                    context.addVerticalSpace(4),
                    Text(
                      context.loc.forgotPasswordBody,
                      textAlign: TextAlign.center,
                      style: context.bodyRegular,
                    ),
                    context.addVerticalSpace(32),
                    PrimaryTextField(
                      controller: emailController,
                      validator: (value) => value!.validateEmail(context),
                      hint: context.loc.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    context.addVerticalSpace(24),
                    PrimaryButton(text: 'Send', onPressed: _handleResetPassword),
                  ],
                ),
              ).padSymmetric(20),
            ),
          ),
        );
      },
    );
  }
}
