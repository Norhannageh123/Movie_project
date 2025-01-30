import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_colors.dart';

import '../../../../utils/app_style.dart';

class BrowseTabsWidget extends StatelessWidget {
  String tabName;
  bool selectedTab;


  BrowseTabsWidget({
    required this.selectedTab,
    required this.tabName,

  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: height * .05,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      decoration: BoxDecoration(
          color: selectedTab == true ? AppColors.yellowColor : AppColors.transparentColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: AppColors.yellowColor,
              width: 2)),
      child: Center(
        child: Text(
            tabName,
            style: selectedTab == true ? AppStyle.black20Bold : AppStyle.yellow20Bold
        ),
      ),
    );
  }
}
