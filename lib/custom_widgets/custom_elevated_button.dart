import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Color? bgColor;
  Color? borderColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? textStyle;
  Function onClickedButton;
  BorderSide? borderSide;
  EdgeInsetsGeometry? padding;
  double?paddingVertical;
  CustomElevatedButton(
      {super.key,
        required this.text,
        this.bgColor,
        this.borderColor,
        this.prefixIcon,
        this.suffixIcon,
        this.textStyle,
        this.borderSide,
        this.padding,
        required this.onClickedButton,
        this.paddingVertical,
      }) {
    textStyle ??= AppStyle.black20Regular;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: width * 0.28,
              vertical: height * 0.0155,
            ),
        backgroundColor: bgColor ?? AppColors.yellowColor,
        shadowColor: AppColors.transparentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderSide ??
                BorderSide(
                  color: borderColor??AppColors.yellowColor,
                  width: 2,
                )),
      ),
      onPressed: () {
        onClickedButton();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox(),
          Text(
            text,
            style: textStyle,
          ),
          SizedBox(width: width*0.015,),
          suffixIcon ?? const SizedBox(),
        ],
      ),
    );
  }
}