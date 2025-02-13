import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/custom_container_rate.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_view_model.dart';
import 'package:movie_app/feature/ui/home/details_screen/movies_suggestions/cubit/movieSuggestionsViewModel.dart';
import 'package:movie_app/feature/ui/home/details_screen/web_view_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();
  @override
  Widget build(BuildContext context) {
    List<String?> screenshotImages = [
      detailsViewModel
          .detailsResponseEntity.data?.movie?.mediumScreenshotImage1,
      detailsViewModel
          .detailsResponseEntity.data?.movie?.mediumScreenshotImage2,
      detailsViewModel
          .detailsResponseEntity.data?.movie?.mediumScreenshotImage3,
    ];

    final arguments = (ModalRoute.of(context)?.settings.arguments) as int;
    print("Movie id $arguments");
    detailsViewModel.getMovieDetails(arguments);

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (_) => detailsViewModel,
      child: BlocBuilder<DetailsViewModel, DetailsState>(
        builder: (context, state) {
          if (state is DetailsErrorState) {
            return Center(
              child: Text(state.failures.errorMessage),
            );
          } else if (state is DetailsLoadingState) {
            return Center(
              child: Lottie.asset('assets/lottie/loading.json'),
            );
          } else if (state is DetailsSuccessState) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: detailsViewModel.detailsResponseEntity.data!
                                  .movie!.largeCoverImage ??
                              'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                          placeholder: (context, url) => Center(
                              child:
                                  Lottie.asset('assets/lottie/loading.json')),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: height * .7,
                        ),
                        Positioned(
                          top: height * 0.1,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios_new_outlined)),
                        ),
                        Positioned(
                          top: height * 0.11,
                          right: width * 0.03,
                          child: InkWell(
                            child: Image.asset(AppImages.saveIcon),
                            onTap: () {
                              // الكود الخاص بالحفظ
                            },
                          ),
                        ),
                        Positioned(
                          top: height * 0.13,
                          right: width * 0.1,
                          left: width * 0.1,
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(AppImages.logoDetailsScreen),
                          ),
                        ),
                        Positioned(
                          top: height * 0.59,
                          right: width * 0.2,
                          left: width * 0.2,
                          child: Text(
                            detailsViewModel
                                    .detailsResponseEntity.data!.movie!.title ??
                                "No title",
                            style: AppStyle.white24Bold,
                          ),
                        ),
                        Positioned(
                          top: height * 0.67,
                          right: width * 0.3,
                          left: width * 0.4,
                          child: Text(
                            detailsViewModel
                                .detailsResponseEntity.data!.movie!.year
                                .toString(),
                            style: AppStyle.white20Regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomElevatedButton(
                            onClickedButton: () async {
                              if (detailsViewModel.detailsResponseEntity.data
                                      ?.movie?.url?.isNotEmpty ??
                                  false) {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewScreen(
                                      url: detailsViewModel
                                              .detailsResponseEntity
                                              .data!
                                              .movie!
                                              .url ??
                                          "",
                                    ),
                                  ),
                                );
                              } else {
                                // يمكنك إظهار snackbar أو dialog لإخبار المستخدم أن الرابط غير متوفر
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('الرابط غير متوفر')),
                                );
                              }
                            },
                            bgColor: AppColors.redColor,
                            text: AppLocalizations.of(context)!.watch,
                            textStyle: AppStyle.white20Regular,
                            borderColor: AppColors.redColor,
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomContainerRate(
                                image: AppImages.heartIcon,
                                text: detailsViewModel.detailsResponseEntity
                                        .data!.movie!.likeCount
                                        ?.toString() ??
                                    "0",
                              ),
                              CustomContainerRate(
                                image: AppImages.clockIcon,
                                text: detailsViewModel.detailsResponseEntity
                                        .data!.movie!.runtime
                                        ?.toString() ??
                                    "0",
                              ),
                              CustomContainerRate(
                                image: AppImages.starIcon,
                                text: detailsViewModel.detailsResponseEntity
                                        .data!.movie!.rating
                                        ?.toStringAsFixed(1) ??
                                    "0.0",
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          //screen shots ui
                          Text(
                            AppLocalizations.of(context)!.screen_shots,
                            style: AppStyle.white24Bold,
                          ),
                          SizedBox(height: height * 0.01),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: height * .02,
                              );
                            },
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: screenshotImages[index] ??
                                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                  placeholder: (context, url) => Center(
                                      child: Lottie.asset(
                                          'assets/lottie/loading.json')),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  height: height * .2,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            itemCount: screenshotImages.length,
                          ),
                          SizedBox(height: height * 0.02),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 270,
                                  crossAxisCount: 2, // Number of columns
                                  crossAxisSpacing:
                                      5, // Spacing between columns
                                  mainAxisSpacing: 5,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: height * .5,
                                    margin: EdgeInsets.all(5),
                                    child:
                                        Stack(fit: StackFit.loose, children: [
                                      Container(
                                        height: height * 0.35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                            AppImages.onBoarding6,
                                            fit: BoxFit.fitHeight,
                                            height: height * .5),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.symmetric(
                                            horizontal: width * .02,
                                            vertical: height * .01),
                                        padding:
                                            EdgeInsetsDirectional.symmetric(
                                                horizontal: width * .02,
                                                vertical: height * .007),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:
                                              AppColors.transparentBlackColor,
                                        ),
                                        child: IntrinsicWidth(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        end: 5),
                                                child: Text("7.7",
                                                    style: AppStyle
                                                        .white16Regular),
                                              ),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: AppColors.yellowColor,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          // genres
                          SizedBox(
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: detailsViewModel.detailsResponseEntity
                                      .data!.movie!.genres!.length ??
                                  1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 16,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: height * 0.005,
                                  ),
                                  width: width * 0.25,
                                  decoration: BoxDecoration(
                                    color: AppColors.babyBlackColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      detailsViewModel.detailsResponseEntity
                                          .data!.movie!.genres![index],
                                      style: AppStyle.white14Regular,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(); // حالة افتراضية
          }
        },
      ),
    );
  }
}
