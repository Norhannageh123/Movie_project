import 'package:flutter/material.dart';
import 'package:movie_app/Utls/app_colors.dart';
import 'package:movie_app/Utls/app_style.dart';



// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  int?maxLines;
  String?Function(String?)?validator;
  TextEditingController? controller;
  Function(String)? onchanged;
  TextInputType keyboardTybe;
  CustomTextField({
    this.keyboardTybe=TextInputType.text,
    this.borderColor,
    required this.hintText,
    this.labelText,
    this.hintStyle,
    this.prefixIcon,
    this.controller,
    this.suffixIcon,
    this.labelStyle,
    this.style,
    this.obscureText,
    this.maxLines=1,
    this.validator,
    this.onchanged,
    });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardTybe,
      onChanged: onchanged,
      controller: controller,
      validator: validator,
      style: style ,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.babyBlackColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor??AppColors.babyBlackColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor??AppColors.babyBlackColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),

        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle??AppStyle.white16Regular,
        labelStyle: labelStyle??AppStyle.white16Regular,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        
      ),
      obscureText: obscureText??false,
      obscuringCharacter: "*",
      cursorColor: AppColors.blackColor,
    );
  }
}