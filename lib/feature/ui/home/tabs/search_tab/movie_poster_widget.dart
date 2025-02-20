import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/feature/custom_widgets/stacked_image_and_rating.dart';

import '../../../../../domain/search_tab/SearchTabEntity.dart';
// ignore: must_be_immutable
class MoviePoster extends StatelessWidget {
  MoviesSearchEntity moviesSearchList;
   MoviePoster({required this.moviesSearchList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:
          StackedImageAndRating(imageUrl:  moviesSearchList.mediumCoverImage,
              rating: moviesSearchList.rating.toString(),
              onItemClicked:()=>onItemClicked(context))
    );

  }
  void onItemClicked(BuildContext context){
    Navigator.pushNamed(context, AppRoutes.detailsScreenRoute,arguments: moviesSearchList.id);
  }
}
