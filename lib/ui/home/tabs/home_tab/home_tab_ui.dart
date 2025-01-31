import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/home/tabs/home_tab/available_slider.dart';
import 'package:movie_app/ui/home/tabs/home_tab/watch_now_slider.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_style.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        top: true,
        child: SingleChildScrollView(
            child: Column(children: [
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
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
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
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
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
              Image.asset(
                AppImages.watchNow,
                scale: .95
              ),
              SizedBox(
                height: height * .04,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Action',
                            style: AppStyle.white20Regular,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'See More',
                                  style: AppStyle.yellow16Regular,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.yellowColor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.25,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                  width: width * 0.35,
                                  child: WatchNowSlider());
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: width * 0.04);
                            },
                            itemCount: 20),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    ])));
  }
}
