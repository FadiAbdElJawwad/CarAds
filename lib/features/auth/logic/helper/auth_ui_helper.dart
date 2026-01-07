import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../model/auth_state.dart';

class AuthUIHelper {
  static String getErrorMessage(BuildContext context, AuthState state) {
    if (state.errorKey == 'invalid-credential') {
      return S.of(context).invalidCredential;
    } else if (state.errorKey == 'weak-password') {
      return S.of(context).weakPassword;
    } else if (state.errorKey == 'email-already-in-use') {
      return S.of(context).usedEmail;
    }

    return state.fallbackMessage ?? S.of(context).authenticationError;
  }
}