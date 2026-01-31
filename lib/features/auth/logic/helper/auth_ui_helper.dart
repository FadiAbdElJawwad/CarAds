import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';


class AuthUIHelper {
  static String getErrorMessage(BuildContext context, String code) {
    final s = S.of(context);
    if (code == 'invalid-credential') {
      return s.invalidCredential;
    } else if (code == 'weak-password') {
      return s.weakPassword;
    } else if (code == 'email-already-in-use') {
      return s.usedEmail;
    } else if (code == 'invalid-email') {
      return s.invalidEmail;
    }

    return s.authenticationError;
  }
}