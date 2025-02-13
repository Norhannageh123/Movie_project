import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart'; 
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/custom_container_rate.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_view_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsViewModel detailsViewModel = getIt<DetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    
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
                          imageUrl: detailsViewModel.detailsResponseEntity.data!.movie!.largeCoverImage ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                          placeholder: (context, url) => Center(child: Lottie.asset('assets/lottie/loading.json')),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          height: height * .7,
                        ),
                        Positioned(
                          top: height * 0.05,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios_new_outlined)),
                        ),
                        Positioned(
                          top: height * 0.06,
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
                          top: height * 0.6,
                          right: width * 0.15,
                          left: width * 0.2,
                          child: Text(
                            detailsViewModel.detailsResponseEntity.data!.movie!.title?? "",
                            style: AppStyle.white24Bold,
                          ),
                        ),
                        Positioned(
                          top: height * 0.68,
                          right: width * 0.3,
                          left: width * 0.4,
                          child: Text(
                            detailsViewModel.detailsResponseEntity.data!.movie!.year.toString(),
                            style: AppStyle.white20Regular,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.005),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: CustomElevatedButton(
                        onClickedButton: () {},
                        bgColor: AppColors.redColor,
                        text: AppLocalizations.of(context)!.watch,
                        textStyle: AppStyle.white20Regular,
                        borderColor: AppColors.redColor,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainerRate(
                          image: AppImages.heartIcon,
                          text: detailsViewModel.detailsResponseEntity.data!.movie!.likeCount?.toString() ?? "0",
                        ),
                        CustomContainerRate(
                          image: AppImages.clockIcon,
                          text: detailsViewModel.detailsResponseEntity.data!.movie!.runtime?.toString() ?? "0",
                        ),
                        CustomContainerRate(
                          image: AppImages.starIcon,
                          text: detailsViewModel.detailsResponseEntity.data!.movie!.rating?.toStringAsFixed(1) ?? "0.0",
                        ),
                      ],
                    ),
                    // genres
                    SizedBox(
                      height: height * 0.2,
                      child: GridView.builder(
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.005,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                            ),
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              color: AppColors.babyBlackColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                'Romance',
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
            );
          } else {
            return Container(); // حالة افتراضية
          }
        },
      ),
    );
  }
}
