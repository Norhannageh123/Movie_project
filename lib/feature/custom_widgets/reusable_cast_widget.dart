import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_view_model.dart';

class ReusableCastWidget extends StatefulWidget {
  // Make index final since it won't change after widget creation
  final int index;
  
  const ReusableCastWidget({required this.index}); // Add key parameter

  @override
  State<ReusableCastWidget> createState() => _ReusableCastWidgetState();
}

class _ReusableCastWidgetState extends State<ReusableCastWidget> {
  // Consider moving this to an inherited widget or state management solution
  final DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    // Get cast member data safely
    final castMember = detailsViewModel.detailsResponseEntity.data?.movie?.cast?[widget.index];
    
    return Container(
      height: height * 0.1,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03, 
        vertical: height * 0.02
      ),
      decoration: BoxDecoration(
        color: AppColors.babyBlackColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: castMember?.urlSmallImage ?? 
                'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
              placeholder: (context, url) => 
                Center(child: Lottie.asset('assets/lottie/loading.json')),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: width * 0.03),
          Expanded( // Add Expanded to prevent overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.name}: ${castMember?.name ?? ''}',
                  style: AppStyle.white20Regular,
                  overflow: TextOverflow.ellipsis, // Handle long text
                ),
                Text(
                  'Character: ${castMember?.character_name ?? ''}',
                  style: AppStyle.white20Regular,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
