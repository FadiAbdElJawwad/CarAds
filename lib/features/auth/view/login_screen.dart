import 'package:car_ads/core/constant/images_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../common/primary_button.dart';
import '../../../common/primary_text_field.dart';
import '../../../core/extension/shared_preferences.dart';
import '../../../core/extension/string_validation.dart';
import '../../../helper/show_snack_bar.dart';
import '../../../helper/auth_service.dart';
import '../../../routes/app_router.dart';
import '../../../routes/screen_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  @override
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formState,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Image.asset(ImagesManager.registration),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Welcome Back to CarAds!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Sign in to your account and get back on track with \n CarAds',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      PrimaryTextField(
                        controller: emailController,
                        validator: (value) {
                          return value!.validateEmail;
                        },
                        hint: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      PrimaryTextField(
                        controller: passwordController,
                        validator: (value) {
                          return value!.validatPassword;
                        },
                        hint: 'Password',
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Your Password?',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(
                        text: 'Login',
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            setState(() => isLoading = true);
                            try {
                              await _authService.loginUser(
                                email: emailController.text,
                                password: passwordController.text,);
                              AppRouter.goToAndRemove(
                                  screenName: ScreenName.home);

                              final name = emailController.text
                                  .split('@')
                                  .first;
                              await storage.write(key: 'name', value: name);

                              logindata.setBool('login', true);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-credential') {
                                showSnackBar(
                                    context, 'Invalid email or password.');
                              } else {
                                showSnackBar(context,
                                    e.message ?? 'Authentication error');
                              }
                            } finally {
                              if (mounted) {
                                setState(() => isLoading = false);
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontSize: 12,
                                  color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  AppRouter.goTo(
                                      screenName: ScreenName.signUpScreen);
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
