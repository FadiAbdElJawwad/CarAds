import 'package:car_ads/core/constant/images_manager.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_button.dart';
import '../../../../common/primary_text_field.dart';
import '../../../../core/extension/responsive_layout_extension.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../../common/show_snack_bar.dart';
import '../../logic/helper/auth_error_messages.dart';
import '../../logic/provider/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.resetState();
    authProvider.addListener(loginListener);
  }


  void loginListener() {
    if (!mounted) return;
    final state = authProvider.state;
    if (state.isSuccess) {
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);
    } else if (state.isFailure) {
      final errorMessage = AuthErrorMessages.getErrorMessage(
          context, state.errorKey ?? '');
      showSnackBar(context, errorMessage);
    }
  }


  Future<void> _handleLogin() async {
    if (!formState.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    await authProvider.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void dispose() {
    authProvider.removeListener(loginListener);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return ModalProgressHUD(
            inAsyncCall: authProvider.state.isLoading,
            child: Scaffold(
                body: Form(
                  key: formState,
                  child: ListView(
                    children: [
                      context.addVerticalSpace(60),
                      Image.asset(ImagesManager.registration),
                      context.addVerticalSpace(16),
                      Text(
                          context.loc
                              .loginTitle,
                          textAlign: TextAlign.center,
                          style: context.titleBold18
                      ),
                      context.addVerticalSpace(4),
                      Text(
                          context.loc
                              .loginBody,
                          textAlign: TextAlign.center,
                          style: context.bodyRegular
                      ),
                      context.addVerticalSpace(32),
                      PrimaryTextField(
                        controller: emailController,
                        validator: (value) {
                          return value!.validateEmail(context);
                        },
                        hint: context.loc
                            .email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      context.addVerticalSpace(16),
                      PrimaryTextField(
                        controller: passwordController,
                        validator: (value) {
                          return value!.validatePassword(context);
                        },
                        hint: context.loc
                            .password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      context.addVerticalSpace(8),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                AppRouter.goTo(
                                    screenName: ScreenName.resetPassword);
                              },
                              child: Text(
                                  context.loc
                                      .forgotPassword,
                                  style: context.inputRegular14.copyWith(
                                      color: Colors.grey)
                              )),
                        ],
                      ),
                      context.addVerticalSpace(24),

                      PrimaryButton(
                          text: context.loc
                              .login,
                          onPressed: _handleLogin
                      ),
                      context.addVerticalSpace(32),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                context.loc
                                    .dontHaveAccount,
                                style: context.bodyRegular.copyWith(
                                    color: Colors.grey)),

                            TextButton(
                                onPressed: () {
                                  AppRouter.goTo(
                                      screenName: ScreenName
                                          .signUpScreen);
                                },
                                child: Text(
                                  context.loc
                                      .signUp,
                                  style: context.bodyRegular,
                                )),
                          ]),
                    ],
                  ),
                ).padSymmetric(20)
            ),
          );
        });
  }
}
