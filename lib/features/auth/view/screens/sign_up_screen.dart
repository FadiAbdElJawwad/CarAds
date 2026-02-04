import 'package:car_ads/core/extension/app_sizes.dart';
import 'package:car_ads/core/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_button.dart';
import '../../../../common/primary_text_field.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/responsive_layout_extension.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/routes/screen_name.dart';
import '../../../../common/show_snack_bar.dart';
import '../../logic/provider/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.addListener(singUpListener);
  }

  void singUpListener() {
    if (authProvider.state.isSuccess) {
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);
    } else if (authProvider.state.isFailure) {
      showSnackBar(context,
          authProvider.state.fallbackMessage ?? 'something went wrong');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    authProvider.removeListener(singUpListener);
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!formState.currentState!.validate()) return;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    await authProvider.signUpUser(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
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
                    Image.asset(ImagesManager.registration,alignment:Alignment.center ,),             context.addVerticalSpace(16),
                    Text(
                      context.loc.signUpTitle,
                      style: context.titleBold18,
                      textAlign: TextAlign.center,
                    ),
                    context.addVerticalSpace(4),
                    Text(context.loc.signUpBody,
                        textAlign: TextAlign.center,
                        style: context.bodyRegular),
                    context.addVerticalSpace(32),
                    PrimaryTextField(
                      controller: nameController,
                      validator: (value) {
                        return value!.validateName(context);
                      },
                      hint: context.loc.name,
                      keyboardType: TextInputType.name,
                    ),
                    context.addVerticalSpace(16),
                    PrimaryTextField(
                      controller: emailController,
                      validator: (value) {
                        return value!.validateEmail(context);
                      },
                      hint: context.loc.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    context.addVerticalSpace(16),
                    PrimaryTextField(
                      controller: passwordController,
                      validator: (value) {
                        return value!.validatePassword(context);
                      },
                      hint: context.loc.password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    context.addVerticalSpace(24),
                    PrimaryButton(
                        text: context.loc.signUp,
                        onPressed: _handleSignUp),
                    context.addVerticalSpace(32),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.loc.alreadyHaveAccount,
                            style: context.bodyRegular.copyWith(
                                color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                AppRouter.back();
                              },
                              child: Text(
                                context.loc.login,
                                style: context.bodyRegular,
                              )),
                        ]),
                  ],
                ),
              ).padSymmetric(20)
          ),
        );
      },
    );
  }
}
