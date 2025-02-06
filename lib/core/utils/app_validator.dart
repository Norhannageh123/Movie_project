import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AppValidator{
  AppValidator._();
  static String? validateEmail(String?val,BuildContext context){
    final local = AppLocalizations.of(context)!;
    RegExp emailRegex= RegExp(  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(val ==null){
      return local.this_field_is_required;
    }else if(val.trim().isEmpty){
      return local.this_field_is_required;
    }else if(emailRegex.hasMatch(val)==false){
      return local.enter_valid_email;
    }else{
      return null;
    }
  }

  static String? validatePassword(String? val,BuildContext context){
    final local = AppLocalizations.of(context)!;
    RegExp passwordRegex=RegExp(r'^(?=.*[a-zA-z])(?=.*[0-9])');
    if(val ==null){
      return local.this_field_is_required;
  } else if(val.isEmpty){
      return local.this_field_is_required;
  }else if(val.length<8||passwordRegex.hasMatch(val)){
    return local.strong_password_please;
  }else{
      return null;
    }
}
static String? validateConfirmPassword(String? val, String? password,BuildContext context){
  final local = AppLocalizations.of(context)!;
  if(val==null||val.isEmpty){
    return local.this_field_is_required;
  }else if(val != password){
    return local.enter_same_password;
  }else{
      return null;
    }
}
static String? validateUserName(String? val,BuildContext context){
  final local = AppLocalizations.of(context)!;
  RegExp userNameRegex=RegExp(r'^[a-zA-z0-9,.-]+$');
  if(val ==null){
      return local.this_field_is_required;
    }else if(val.isEmpty){
      return local.this_field_is_required;
    }else if(!userNameRegex.hasMatch(val)==false){
      return local.enter_valid_email;
    }else{
      return null;
    }
}
static String? validateFullName(String? val,BuildContext context ){
  final local = AppLocalizations.of(context)!;
  if(val==null||val.isEmpty){
    return local.this_field_is_required;
  }else{
      return null;
    }
}
static String? validatePhoneNumber(String? val,BuildContext context){
  final local = AppLocalizations.of(context)!;
  if(val == null){
     return local.this_field_is_required;
  }else if(int.tryParse(val.trim())==null){
    return local.enter_numbers_only;
  }else if(val.trim().length!=11){
    return local.enter_11_digit;
  }else {
    return null;
  }
}
}