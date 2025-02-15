import 'package:flutter/cupertino.dart';
import 'package:movie_app/core/utils/app_style.dart';

class SummaryText extends StatelessWidget {
  const SummaryText({super.key, required this.descriptionFull, required this.descriptionIntro});

  final String descriptionFull;
  final String descriptionIntro;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            descriptionFull.trim().isNotEmpty == true
                ? descriptionFull
                : descriptionIntro.trim().isNotEmpty == true
                ? descriptionIntro
                : 'No Description Available',
            style: AppStyle.white16Regular,
          )
        ],
      ),
    );
  }
}