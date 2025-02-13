import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';

class Profiletab extends StatefulWidget {
  Profiletab();

  @override
  State<Profiletab> createState() => _ProfiletabState();
}
class _ProfiletabState extends State<Profiletab> {
  List<String> wishList = [];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.transparentColor,
                        radius: width * .15,
                        child: Image.asset(
                          AppImages.avatar1,
                          height: height * 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Mustafa Musa',
                        style: AppStyle.white20Bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * .05,
                  ),
                  Column(
                    children: [
                      Text('123', style: AppStyle.white30BoldInter),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(AppLocalizations.of(context)!.wish_list,
                          style: AppStyle.white24Bold),
                    ],
                  ),
                  SizedBox(
                    width: width * .05,
                  ),
                  Column(
                    children: [
                      Text('321', style: AppStyle.white30BoldInter),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(AppLocalizations.of(context)!.history,
                          style: AppStyle.white24Bold),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomElevatedButton(
                      borderColor: AppColors.transparentColor,
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.1, vertical: height * 0.01),
                      onClickedButton: () {
                        Navigator.pushNamed(
                            context, AppRoutes.updateProfileRoute);
                      },
                      bgColor: AppColors.yellowColor,
                      text: AppLocalizations.of(context)!.edit_profile,
                      textStyle: AppStyle.black20Regular,
                    ),
                  ),
                  SizedBox(
                    width: width * .03,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomElevatedButton(
                      borderColor: AppColors.transparentColor,
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: width * 0.08, vertical: height * 0.01),
                      onClickedButton: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.loginRoute);
                      },
                      bgColor: AppColors.redColor,
                      text: AppLocalizations.of(context)!.exit,
                      textStyle: AppStyle.white20Regular,
                      suffixIcon: Image.asset(AppImages.exitIcon),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TabBar(
                labelColor: AppColors.yellowColor,
                dividerColor: AppColors.transparentColor,
                indicatorColor: AppColors.yellowColor,
                tabAlignment: TabAlignment.fill,
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage(AppImages.watchListIcon)),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text('${AppLocalizations.of(context)!.watch} List',
                              style: AppStyle.white20Regular),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage(AppImages.historyIcon)),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(AppLocalizations.of(context)!.history,
                              style: AppStyle.white20Regular),
                        ],
                      ),
                    ],
                  ),
                ],
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // todo: wishlist & history list
              Expanded(
                child: selectedIndex == 0
                    ? Center(
                        child: wishList.isEmpty
                            ? Image.asset(
                                AppImages.searchImage,
                                fit: BoxFit.cover,
                              )
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2, //
                                  childAspectRatio: 0.5, // Number of columns
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'data2',
                                          style: AppStyle.white20Bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: 30,
                              ),
                      )
                    : Center(
                        child: GridView.builder(
                          padding: EdgeInsetsDirectional.only(start: 5),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 10,
                            childAspectRatio: .70, // Spacing between rows
                          ),
                          itemBuilder: (context, index) {
                            return SafeArea(
                              child: Stack(fit: StackFit.loose, children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      AppImages.onBoarding5,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  margin: EdgeInsetsDirectional.symmetric(
                                      horizontal: width * .02,
                                      vertical: height * .01),
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: width * .01,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.transparentBlackColor,
                                  ),
                                  child: IntrinsicWidth(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 5),
                                          child: Text(
                                            "7.7",
                                            style: AppStyle.white16Regular,
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.star_fill,
                                          color: AppColors.yellowColor,
                                          size: 18,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            );
                          },
                          itemCount: 30,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}