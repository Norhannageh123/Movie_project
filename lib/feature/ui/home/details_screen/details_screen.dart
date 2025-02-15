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
import 'package:movie_app/feature/custom_widgets/toast.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_view_model.dart';
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
    final movieId = (ModalRoute.of(context)?.settings.arguments) as int;
    detailsViewModel.getMovieDetails(movieId);

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
            return _buildMovieDetails(context);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context) {
    final movie = detailsViewModel.detailsResponseEntity.data?.movie;
    if (movie == null) return const SizedBox.shrink();

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    List<String?> screenshotImages = [
      movie.medium_screenshot_image1,
      movie.medium_screenshot_image2,
      movie.medium_screenshot_image3,
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie Poster Section
            Stack(
              children: [
                // Movie Poster
                CachedNetworkImage(
                  imageUrl: movie.medium_cover_image ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                  placeholder: (context, url) => Center(
                    child: Lottie.asset('assets/lottie/loading.json'),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: height * .7,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Back Button
                Positioned(
                  top: height * 0.05,
                  left: width * 0.03,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
                    ),
                  ),
                ),

                // Save Button
                Positioned(
                  top: height * 0.05,
                  right: width * 0.03,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (detailsViewModel.toggleSavedIcon.getToggleIcon() == 0) {
                          detailsViewModel.savedMovie(movie.id!, movie);
                          ToastHelper.showSuccessToast("Saved Successfully");
                        } else {
                          detailsViewModel.deleteMovie(movie.id!);
                          ToastHelper.showSuccessToast("UnSaved Successfully");
                        }
                      },
                      icon: detailsViewModel.toggleSavedIcon.getToggleIcon() == 0
                          ? Icon(Icons.save, color: Colors.white)
                          : Image.asset(AppImages.saveIcon),
                    ),
                  ),
                ),

                // Logo
                Positioned(
                  top: height * 0.13,
                  right: width * 0.1,
                  left: width * 0.1,
                  child: Image.asset(AppImages.logoDetailsScreen),
                ),

                // Movie Title
                Positioned(
                  bottom: height * 0.08,
                  right: width * 0.1,
                  left: width * 0.1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      movie.title ?? "No title",
                      style: AppStyle.white24Bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Movie Year
                Positioned(
                  bottom: height * 0.02,
                  right: width * 0.1,
                  left: width * 0.1,
                  child: Text(
                    movie.year.toString(),
                    style: AppStyle.white20Regular,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Watch Button
            Padding(
              padding: EdgeInsets.all(16),
              child: CustomElevatedButton(
                onClickedButton: () async {
                  if (movie.url?.isNotEmpty ?? false) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(url: movie.url!),
                      ),
                    );
                  } else {
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
            ),

            // Movie Stats
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainerRate(
                    image: AppImages.heartIcon,
                    text: movie.like_count?.toString() ?? "0",
                  ),
                  CustomContainerRate(
                    image: AppImages.clockIcon,
                    text: movie.runtime?.toString() ?? "0",
                  ),
                  CustomContainerRate(
                    image: AppImages.starIcon,
                    text: movie.rating?.toStringAsFixed(1) ?? "0.0",
                  ),
                ],
              ),
            ),

            // Screenshots Section
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.screen_shots,
                    style: AppStyle.white24Bold,
                  ),
                  SizedBox(height: 16),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    itemCount: screenshotImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: screenshotImages[index] ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                          placeholder: (context, url) => Center(
                            child: Lottie.asset('assets/lottie/loading.json'),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          height: height * .2,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Genres Grid

            if (movie.genres != null && movie.genres!.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                    AppLocalizations.of(context)!.screen_shots,
                    style: AppStyle.white24Bold,
                  ),
                  SizedBox(height: 16),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: movie.genres!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.babyBlackColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              movie.genres![index],
                              style: AppStyle.white14Regular,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}