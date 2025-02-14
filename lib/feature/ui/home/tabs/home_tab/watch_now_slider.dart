import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';

// ignore: must_be_immutable
class WatchNowSlider extends StatelessWidget {
  MoviesListEntity moviesListEntity;
  int index = 0;

  WatchNowSlider({required this.moviesListEntity, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(fit: StackFit.loose, children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          child: CachedNetworkImage(
            imageUrl: moviesListEntity.data?.movies?[index].mediumCoverImage ??
                'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
            placeholder: (context, url) => Center(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
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
                  "${moviesListEntity.data!.movies![index].rating}",
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
