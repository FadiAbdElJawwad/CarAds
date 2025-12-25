import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../common/primary_button.dart';
import '../../../common/primary_text_field.dart';
import '../../../core/constant/images_manager.dart';
import '../../../core/extension/shared_preferences.dart';
import '../../../core/extension/string_validation.dart';
import '../../../helper/show_snack_bar.dart';
import '../../../helper/auth_service.dart';
import '../../../routes/app_router.dart';
import '../../../routes/screen_name.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
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
                      Text(
                        'Join CarAds Today!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Create your account and become a part of CarAds community's",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      PrimaryTextField(
                        controller: nameController,
                        validator: (value) {
                          return value!.validatName;
                        },
                        hint: 'Full Name',
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      PrimaryTextField(
                        controller: emailController,
                        validator: (value) {
                          return value!.validateEmail;
                        },
                        hint: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
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
                              child: Text(
                                'Forgot Your Password?',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(
                        text: 'Sign Up',
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            setState(() => isLoading = true);
                            try {
                              await _authService.registerUser(
                                email: emailController.text,
                                password: passwordController.text,);
                              AppRouter.goToAndRemove(
                                  screenName: ScreenName.home);

                              await storage.write(
                                  key: 'name', value: nameController.text);
                              logindata.setBool('login', true);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(
                                    context,
                                    'The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(context,
                                    'The account already exists for that email.');
                              } else {
                                showSnackBar(
                                    context, e.message ?? 'An error occurred');
                              }
                            } finally {
                              setState(() => isLoading = false);
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(fontSize: 12,
                                  color: Colors.grey),
                            ),
                            TextButton(
                                onPressed: () {
                                  AppRouter.goTo(screenName: ScreenName.login);
                                },
                                child: Text(
                                  'Login',
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.black),
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
