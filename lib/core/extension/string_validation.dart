import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

extension StringValidation on String {

  String? validateGeneric(String fieldName) {
    if (trim().isEmpty) {
      return '$fieldName cannot be empty';
    }
    return null;
  }

  String? validateLicenseNumber() {
    if (trim().isEmpty) {
      return 'Driving License No cannot be empty';
    }
    if (int.tryParse(this) == null) {
      return 'Driving License No must be a number';
    }
    if (length >= 10) {
      return 'Driving License No must be less than 10 digits';
    }
    return null;
  }

  String? validateIdNumber() {
    if (trim().isEmpty) {
      return 'ID Number cannot be empty';
    }
    if (int.tryParse(this) == null) {
      return 'ID Number must be a number';
    }
    if (length >= 9) {
      return 'ID Number must be less than 9 digits';
    }
    return null;
  }

  String? validateName(BuildContext context) {
    if (isEmpty) {
      return S
          .of(context)
          .emptyName;
    }
    return null;
  }

  String? validateMobile(BuildContext context) {
    if (trim().isEmpty) {
      return S
          .of(context)
          .emptyMobile;
    }
    if (!trim().startsWith('+')) {
      return 'Phone number must start with a country code (e.g. +971)';
    }
    if (length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateEmail(BuildContext context) {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    if (isEmpty) {
      return S.of(context).emptyEmail;
    } else if (!emailRegExp.hasMatch(this)) {
      return S.of(context).incorrectEmail;
    }
    return null;
  }

  String? validatePassword(BuildContext context) {
    if (isEmpty) {
      return S
          .of(context)
          .emptyPassword;
    } else if (length < 6) {
      return S
          .of(context)
          .incorrectPassword;
    }
    return null;
  }

  String? validateNewPassword(BuildContext context, String currentPassword) {
    final baseError = validatePassword(context);
    if (baseError != null) return baseError;
    if (this == currentPassword) {
      return 'New password cannot be the same as current';
    }
    return null;
  }

  String? validateConfirmPassword(BuildContext context, String newPassword) {
    final baseError = validatePassword(context);
    if (baseError != null) return baseError;
    if (this != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
