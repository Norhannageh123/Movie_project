import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';


class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.whiteColor, size: 25),
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      titleTextStyle: AppStyle.yellow16Regular,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    iconTheme: const IconThemeData(color: AppColors.whiteColor, size: 25),
  );
}