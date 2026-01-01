import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../common/primary_button.dart';
import '../../../../common/primary_text_field.dart';
import '../../../../core/constant/images_manager.dart';
import '../../../../core/extension/string_validation.dart';
import '../../../../generated/l10n.dart';
import '../../../../routes/app_router.dart';
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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return ModalProgressHUD(
          inAsyncCall: authProvider.isLoading,
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
                            S
                                .of(context)
                                .signUpTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            S
                                .of(context)
                                .signUpBody,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          PrimaryTextField(
                            controller: nameController,
                            validator: (value) {
                              return value!.validateName(context);
                            },
                            hint: S
                                .of(context)
                                .name,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          PrimaryTextField(
                            controller: emailController,
                            validator: (value) {
                              return value!.validateEmail(context);
                            },
                            hint: S
                                .of(context)
                                .email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          PrimaryTextField(
                            controller: passwordController,
                            validator: (value) {
                              return value!.validatePassword(context);
                            },
                            hint: S
                                .of(context)
                                .password,
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
                                    S
                                        .of(context)
                                        .forgotPassword,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          PrimaryButton(
                            text: S
                                .of(context)
                                .signUp,
                            onPressed: () {
                              if (formState.currentState!.validate()) {
                                authProvider.signUpUser(
                                  context: context,
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
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
                                  S
                                      .of(context)
                                      .alreadyHaveAccount,
                                  style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () {
                                      AppRouter.back();
                                    },
                                    child: Text(
                                      S
                                          .of(context)
                                          .login,
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
      },
    );
  }
}
