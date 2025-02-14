import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_style.dart';

class StackedImageAndRating extends StatelessWidget {
  String? imageUrl;
  String rating;
  VoidCallback onItemClicked;

   StackedImageAndRating({super.key,required this.imageUrl,required this.rating,required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Stack(fit: StackFit.loose, children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child:
          InkWell(
            onTap: onItemClicked,
            child: CachedNetworkImage(imageUrl: imageUrl??'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder:(context, url) => Center(child: Lottie.asset('assets/lottie/loading.json',)),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill, height: height * .5),
          )),
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
                  rating,
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
    ]);
  }
}
