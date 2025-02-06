import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
class AvailableSlider extends StatelessWidget {
  const AvailableSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(

      child: Stack(fit: StackFit.loose, children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(AppImages.onBoarding6,
                fit: BoxFit.fill, height: height * .5)),
        Container(
          margin: EdgeInsetsDirectional.symmetric(
              horizontal: width * .02, vertical: height * .01),
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: width * .02, vertical: height * .007),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.transparentBlackColor,
          ),
          child: IntrinsicWidth(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 5),
                  child: Text(
                    "7.7",
                    style: AppStyle.white16Regular,
                  ),
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: AppColors.yellowColor,
                  size: 18,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
