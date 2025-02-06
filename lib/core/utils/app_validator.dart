import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppValidator {
  AppValidator._();

  // التحقق من البريد الإلكتروني
  static String? validateEmail(String? val, BuildContext context) {
    final local = AppLocalizations.of(context)!;
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null) {
      return local.this_field_is_required;
    } else if (val.trim().isEmpty) {
      return local.this_field_is_required;
    } else if (!emailRegex.hasMatch(val)) {
      return local.enter_valid_email;
    } else {
      return null;
    }
  }

  // التحقق من كلمة المرور
  static String? validatePassword(String? val, BuildContext context) {
    final local = AppLocalizations.of(context)!;

    RegExp passwordRegex =
        RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    if (val == null) {
      return local.this_field_is_required;
    } else if (val.isEmpty) {
      return local.this_field_is_required;
    } else if (!passwordRegex.hasMatch(val)) {
      return local.strong_password_please;
    } else {
      return null;
    }
  }

  // التحقق من تأكيد كلمة المرور
  static String? validateConfirmPassword(
      String? val, String? password, BuildContext context) {
    final local = AppLocalizations.of(context)!;
    if (val == null || val.isEmpty) {
      return local.this_field_is_required;
    } else if (val != password) {
      return local.enter_same_password;
    } else {
      return null;
    }
  }

  // التحقق من اسم المستخدم
  static String? validateUserName(String? val, BuildContext context) {
    final local = AppLocalizations.of(context)!;
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null) {
      return local.this_field_is_required;
    } else if (val.isEmpty) {
      return local.this_field_is_required;
    } else if (!userNameRegex.hasMatch(val)) {
      return local.enter_valid_user_name;
    } else {
      return null;
    }
  }

  // التحقق من الاسم الكامل
  static String? validateFullName(String? val, BuildContext context) {
    final local = AppLocalizations.of(context)!;
    if (val == null || val.isEmpty) {
      return local.this_field_is_required;
    } else {
      return null;
    }
  }

  // التحقق من رقم الهاتف
  static String? validatePhoneNumber(String? val, BuildContext context) {
    final local = AppLocalizations.of(context)!;
    if (val == null) {
      return local.this_field_is_required;
    } else if (int.tryParse(val.trim()) == null) {
      return local.enter_numbers_only;
    } else if (val.trim().length != 11) {
      return local.enter_11_digit;
    } else {
      return null;
    }
  }
}
