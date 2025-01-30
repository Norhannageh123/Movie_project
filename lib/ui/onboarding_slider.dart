import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_style.dart';

import '../custom_widgets/custom_elevated_button.dart';
import 'auth/Login/login_screen.dart';

class OnboardingSlider extends StatefulWidget {
  String image;
  String title;
  String? desc;
  int currentPage;
  PageController controller;

  OnboardingSlider(
      {super.key,
      required this.image,
      required this.title,
      this.desc,
      required this.currentPage,
      required this.controller});

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(alignment: Alignment.bottomCenter, children: [
      // image given in slider
      Positioned.fill(
          child: Image(
        image: AssetImage(widget.image),
        fit: BoxFit.fill,
      )),
      widget.currentPage == 0
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .05, vertical: height * .02),
              child: drawBottomSheet(height),
            )
          : IntrinsicHeight(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .05, vertical: height * .02),
                  decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: drawBottomSheet(height)),
            )
    ]);
  }

  Widget drawBottomSheet(var height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.title,
          style: widget.currentPage == 0
              ? AppStyle.white30BoldInter
              : AppStyle.white24Bold,
          textAlign: TextAlign.center,
        ),
        Text(
          widget.desc ?? "",
          style: widget.currentPage == 0
              ? AppStyle.lightWhite20Regular
              : AppStyle.white20Regular,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: height * .01,
        ),
        widget.currentPage == 0
            ? CustomElevatedButton(
                paddingVertical: height * .01,
                text: AppLocalizations.of(context)!.explore_now,
                onClickedButton: () {
                  widget.controller.nextPage(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastEaseInToSlowEaseOut);
                },
                bgColor: AppColors.yellowColor,
                textStyle: AppStyle.black20SemiBoldInter,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      paddingVertical: height * .01,
                      text: widget.currentPage == 5
                          ? AppLocalizations.of(context)!.finish
                          : AppLocalizations.of(context)!.next,
                      onClickedButton: () {
                        if (widget.currentPage == 5) {
                          //logic when clicked on finish button
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }
                        widget.controller.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.fastEaseInToSlowEaseOut);
                      },
                      bgColor: AppColors.yellowColor,
                      textStyle: AppStyle.black20SemiBoldInter),
                  SizedBox(
                    height: height * .01,
                  ),
                  CustomElevatedButton(
                      paddingVertical: height * .01,
                      text: AppLocalizations.of(context)!.back,
                      onClickedButton: () {
                        widget.controller.previousPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.fastEaseInToSlowEaseOut);
                      },
                      bgColor: AppColors.blackColor,
                      textStyle: AppStyle.yellow20SemiBoldInter)
                ],
              )
      ],
    );
  }
}
