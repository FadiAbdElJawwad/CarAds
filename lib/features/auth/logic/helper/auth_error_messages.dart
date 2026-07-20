import 'package:flutter/material.dart';
import '../../../../core/extension/app_sizes.dart';

class AuthErrorMessages {
  static String getErrorMessage(BuildContext context, String code) {
    if (code == 'invalid-credential') {
      return context.loc.invalidCredential;
    } else if (code == 'weak-password') {
      return context.loc.weakPassword;
    } else if (code == 'email-already-in-use') {
      return context.loc.usedEmail;
    } else if (code == 'invalid-email') {
      return context.loc.invalidEmail;
    }

    return context.loc.authenticationError;
  }
}