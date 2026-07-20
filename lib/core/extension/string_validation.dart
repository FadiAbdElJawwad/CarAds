import 'package:flutter/material.dart';
import 'app_sizes.dart';

extension StringValidation on String {
  String? validateGeneric(BuildContext context, String fieldName) {
    if (trim().isEmpty) {
      return context.loc.fieldCannotBeEmpty(fieldName);
    }
    return null;
  }

  String? validateLicenseNumber(BuildContext context) {
    if (trim().isEmpty) {
      return context.loc.drivingLicenseEmpty;
    }
    if (int.tryParse(this) == null) {
      return context.loc.drivingLicenseMustBeNumber;
    }
    if (length >= 10) {
      return context.loc.drivingLicenseTooLong;
    }
    return null;
  }

  String? validateIdNumber(BuildContext context) {
    if (trim().isEmpty) {
      return context.loc.idNumberEmpty;
    }
    if (int.tryParse(this) == null) {
      return context.loc.idNumberMustBeNumber;
    }
    if (length >= 9) {
      return context.loc.idNumberTooLong;
    }
    return null;
  }

  String? validateName(BuildContext context) {
    if (isEmpty) {
      return context.loc.emptyName;
    }
    return null;
  }

  String? validateMobile(BuildContext context) {
    if (trim().isEmpty) {
      return context.loc.emptyMobile;
    }
    if (!trim().startsWith('+')) {
      return context.loc.mobileStartWithCountryCode;
    }
    if (length < 10) {
      return context.loc.invalidMobile;
    }
    return null;
  }

  String? validateEmail(BuildContext context) {
    final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    );
    if (isEmpty) {
      return context.loc.emptyEmail;
    } else if (!emailRegExp.hasMatch(this)) {
      return context.loc.incorrectEmail;
    }
    return null;
  }

  String? validatePassword(BuildContext context) {
    if (isEmpty) {
      return context.loc.emptyPassword;
    } else if (length < 6) {
      return context.loc.incorrectPassword;
    }
    return null;
  }

  String? validateNewPassword(BuildContext context, String currentPassword) {
    final baseError = validatePassword(context);
    if (baseError != null) return baseError;
    if (this == currentPassword) {
      return context.loc.passwordSameAsCurrent;
    }
    return null;
  }

  String? validateConfirmPassword(BuildContext context, String newPassword) {
    final baseError = validatePassword(context);
    if (baseError != null) return baseError;
    if (this != newPassword) {
      return context.loc.passwordsDoNotMatch;
    }
    return null;
  }
}