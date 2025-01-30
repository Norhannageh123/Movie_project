import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/tabs/home_tab/available_slider.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.fullyTransparentBlackColor,
                        Colors.transparent
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    AppImages.onBoarding6,
                    height: height * .7,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.availableNow),
                  CarouselSlider.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: AvailableSlider(),
                    ),
                    options: CarouselOptions(
                        height: height * .4,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: .5,
                        padEnds: true,
                        enlargeFactor: .3),
                  ),
                  Image.asset(AppImages.watchNow),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
