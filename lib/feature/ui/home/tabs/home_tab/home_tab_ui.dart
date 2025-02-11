import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/available_slider.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/cubit/home_state.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/cubit/home_view_model.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/watch_now_slider.dart';
import '../../../../../core/di/inject.dart';
import '../../../../../core/utils/app_routes.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();

}


class _HomeTabState extends State<HomeTab> {
  ///any view should know his viewModel

  HomeViewModel homeViewModel=getIt<HomeViewModel>();
  static int selectedImageSlider=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("movieeees");
    homeViewModel.getMoviesList();
    homeViewModel.getFilterGenreMoviesList();
    //print(homeViewModel.moviesFilterGenreList.data!.movies!.length);
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeViewModel,HomeState>(
    //   (listener: (context,state){
    //   if(state is HomeLoadingState){
    //     print("Loading");
    //   }
    //   else if(state is HomeErrorState){
    //     print("errror");
    //     print(state.failures.errorMessage);
    //
    //   }
    //   else if(state is HomeSuccessState){
    //     print("success");
    //     print(homeViewModel.moviesList.data?.movies?.length??0);
    //     print(homeViewModel.moviesList.data?.movies?[selectedImageSlider].backgroundImageOriginal);
    //
    //   }
    //   print(homeViewModel.moviesList.data?.movies?.length??0);
    // },
    bloc: homeViewModel
    ,builder:(context,state){
      if(state is HomeErrorState){
        return Center(child: Text(state.failures.errorMessage),);
      }else if(state is HomeLoadingState){
        return Center(child: Lottie.asset('assets/lottie/loading.json'));
      }else if(state is HomeSuccessState){
      return

      SafeArea(
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
              child:  CachedNetworkImage(imageUrl: homeViewModel.moviesList.data?.
              movies?[selectedImageSlider].largeCoverImage??'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                placeholder:(context, url) => Center(child: Lottie.asset('assets/lottie/loading.json'),),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: height * .7,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.availableNow),
              CarouselSlider.builder(
                itemCount: homeViewModel.moviesList.data?.movies?.length??0,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                      var movie = homeViewModel.moviesList.data?.movies?[itemIndex];
                      return AvailableSlider(moviesList: movie!,);
                    },
                options: CarouselOptions(
                    height: height * .4,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: .5,
                    padEnds: true,
                    enlargeFactor: .3,
                onPageChanged: (index,_){
                  selectedImageSlider=index;
                  setState(() {

                  });
                }),
              ),
              Image.asset(
                AppImages.watchNow,
                scale: .95
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeViewModel.moviesFilterGenreList.data?.movies?[0].genres?[0]??"",
                            style: AppStyle.white20Regular,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(AppRoutes.browseRoute);
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
                              print(index);
                              return SizedBox(
                                  width: width * 0.35,
                                  child: WatchNowSlider(moviesListEntity: homeViewModel.moviesFilterGenreList, index: index,));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: width * 0.04);
                            },
                            itemCount: 3),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    ])));}
          else{
            return Container();
          }
    });
  }
}
