import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

extension StringValidation on String {

  String? validateName(BuildContext context) {
    if (isEmpty) {
      return S.of(context).emptyName;
    }
    return null;
  }

  String? validateMobile(BuildContext context) {
    if (isEmpty) {
      return S.of(context).emptyMobile;
    }
    return null;
  }

  String? validateEmail(BuildContext context) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isEmpty) {
      return S.of(context).emptyEmail;
    } else if (!emailRegExp.hasMatch(this)) {
      return S.of(context).incorrectEmail;
    }
    return null;
  }

  String? validatePassword(BuildContext context) {
    if (isEmpty) {
      return S.of(context).emptyPassword;
    } else if (length < 6) {
      return S.of(context).incorrectPassword;
    }
    return null;
  }
}
