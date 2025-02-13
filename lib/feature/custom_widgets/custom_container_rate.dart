import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';

// ignore: must_be_immutable
class CustomContainerRate extends StatelessWidget {
   CustomContainerRate({super.key,required this.image,required this.text});
 String image;
 String text;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.005,
      ),
      width: width*0.25,
      height: height*0.04,
      decoration: BoxDecoration(
        color: AppColors.babyBlackColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          Text(
            text,
            style: AppStyle.white20Regular,
          )
        ],
      ),
    );
  }
}
