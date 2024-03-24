import 'package:flutter/material.dart';

String? validateField(value, {required BuildContext context}) {
  if (value.length < 4) {
    return "Please enter at least 4 characters";
  }

  return null;
}

String? validateDropdownField(value, {required BuildContext context}) {
  if (value.length == 0) {
    return "Please select an option";
  }

  return null;
}

String? validateUserName(value, {required BuildContext context}) {
  if (value == null || value.isEmpty) {
    return "Please enter your username";
  }
  return null;
}

String? validateIsEmpty(String value, {required BuildContext context}) {
  if (value.isEmpty) {
    return "field must not be empty";
  }
  return null;
}

String? validateAtLeast(String value, int nChars,
    {required BuildContext context}) {
  if (value.length < nChars) {
    return "at least ${nChars.toString()}";
  }
  return null;
}

String? validateUserEmail(value, {required BuildContext context}) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? "Enter a valid email address"
      : validateIsEmpty(value, context: context);
}

String? validateUserPassword(value, {required BuildContext context}) {
  if (value.length < 9) {
    return "please enter at leas 8 character";
  }
  return null;
}

String? validateUserPasswordConfirmation(value, value2,
    {required BuildContext context}) {
  if (value != value2) {
    return "password does not match";
  }
  return null;
}

String? noSpacesUrl(value) {
  String url = value.toString().replaceAll(RegExp(r' '), '_').toLowerCase();

  return url;
}
