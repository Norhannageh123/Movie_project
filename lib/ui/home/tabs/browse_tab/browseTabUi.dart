import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_style.dart';
import 'browse_tabs_widget.dart';


class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> moviesGenresList = [
      AppLocalizations.of(context)!.action,
      'Adventure',
      'Romance',
      'Sci_Fic',
      'Horror',
      'War',
    ];
    return Scaffold(
        body: ListView(
            children: [
              Column(
                children: [
                  DefaultTabController(
                      length: moviesGenresList.length,
                      child: TabBar(
                          onTap: (index) {
                            selectedIndex = index;
                            setState(() {});
                          },
                          labelPadding: EdgeInsets.all(0.8),
                          dividerColor: AppColors.transparentColor,
                          indicatorColor: AppColors.transparentColor,
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          tabs: moviesGenresList.map((tabName) {
                            return BrowseTabsWidget(
                                selectedTab: selectedIndex ==
                                    moviesGenresList.indexOf(tabName),
                                tabName: tabName);
                          }).toList())),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 0, // Spacing between columns
                          mainAxisSpacing: 10.0,
                          childAspectRatio: .5// Spacing between rows
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: height*.5,
                          margin: EdgeInsets.all(2),
                          child: Stack(
                              fit: StackFit.loose, children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(AppImages.onBoarding2,
                                    fit: BoxFit.fitHeight, height: height * .5)),
                            Container(
                              margin: EdgeInsetsDirectional.symmetric(
                                  horizontal: width * .02, vertical: height * .01),
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: width * .02, vertical: height * .007),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.transparentBlackColor,
                              ),
                              child: IntrinsicWidth(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(end: 5),
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
                      })
                ],
              ),
            ]));
  }
}
