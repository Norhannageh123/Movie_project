import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';


class CastBuilder extends StatelessWidget {
  const CastBuilder({super.key, required this.movieCast});

  final List<CastDetailsEntity> movieCast;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  Cast',
          style: AppStyle.white24Bold,
        ),
        movieCast.isNotEmpty ? Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: movieCast.length,
              itemBuilder: (context, index) {
                return buildCastCard(
                    name: movieCast[index].name ?? '',
                    character: movieCast[index].character_name ?? '',
                    image: movieCast[index].urlSmallImage ?? '',
                    width: width,
                    height: height);
              }),
        ) : Center(child: Text("No Cast Available", style: AppStyle.white16Regular)),
      ],
    );
  }
}

Widget buildCastCard(
    {required String name,
    required String character,
    required String image,
    required double width,
    required double height}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: height * 0.01),
    padding:
        EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
    decoration: BoxDecoration(
      color: AppColors.babyBlackColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name : $name',
              style: AppStyle.white16Regular
            ),
            Text(
              'Character : $character',
              style: AppStyle.white16Regular,
            ),
          ],
        )
      ],
    ),
  );
}