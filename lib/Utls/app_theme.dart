import 'package:flutter/material.dart';
import 'package:movie_app/Utls/app_colors.dart';
import 'package:movie_app/Utls/app_style.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      titleTextStyle: AppStyle.yellow16Regular,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    iconTheme: const IconThemeData(color: AppColors.whiteColor, size: 25),
  );
}
