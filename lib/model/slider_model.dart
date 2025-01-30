import 'package:flutter/cupertino.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SliderModel{
  String image;
  String title;
  String? description;

  SliderModel({required this.image, required this.title, this.description});

}
List<SliderModel>getSlides(BuildContext context) {
  return [
  SliderModel(image: AppImages.onBoarding1,
      title: AppLocalizations.of(context)!.find_your_next_favorite_movie_here,
      description: AppLocalizations.of(context)!.get_access_to_a_huge_library)
  ,
  SliderModel(image: AppImages.onBoarding2, title: AppLocalizations.of(context)!.discover_movies,description: AppLocalizations.of(context)!.explore_a_vast_collection_of_movies ),
  SliderModel(image: AppImages.onBoarding3, title: AppLocalizations.of(context)!.explore_all_genres,description: AppLocalizations.of(context)!.discover_movies_from_every_genre ),
  SliderModel(image: AppImages.onBoarding4, title: AppLocalizations.of(context)!.create_watchLists ,description: AppLocalizations.of(context)!.save_movies_to_your_watchList),
  SliderModel(image: AppImages.onBoarding5, title: AppLocalizations.of(context)!.rate_review_learn ,description: AppLocalizations.of(context)!.share_your_thoughts_on_the_movies ),
  SliderModel(image: AppImages.onBoarding6, title: AppLocalizations.of(context)!.start_watching_now)
  ];
}