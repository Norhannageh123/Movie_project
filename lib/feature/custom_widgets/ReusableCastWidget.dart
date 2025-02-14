import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_view_model.dart';

class ReusableCastWidget extends StatefulWidget {
  int index;

  ReusableCastWidget({required this.index});

  @override
  State<ReusableCastWidget> createState() => _ReusableCastWidgetState();
}

class _ReusableCastWidgetState extends State<ReusableCastWidget> {
  DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .1,
      padding:
          EdgeInsets.symmetric(horizontal: width * .03, vertical: height * .02),
      decoration: BoxDecoration(
          color: AppColors.babyBlackColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: detailsViewModel.detailsResponseEntity.data?.movie?.cast?[widget.index].urlSmallImage ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder: (context, url) =>
                  Center(child: Lottie.asset('assets/lottie/loading.json')),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(
            width: width * .03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppLocalizations.of(context)!.name}: ${detailsViewModel.detailsResponseEntity.data?.movie?.cast?[widget.index].name}' ?? '',
                style: AppStyle.white20Regular,
              ),
              Text(
                '${AppLocalizations.of(context)!.character}: ${detailsViewModel.detailsResponseEntity.data?.movie?.cast?[widget.index].characterName}' ?? '',
                style: AppStyle.white20Regular,
              ),
            ],
          )
        ],
      ),
    );
  }
}
