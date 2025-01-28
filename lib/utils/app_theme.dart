import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTheme {
  static final ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    iconTheme: const IconThemeData(color: AppColors.whiteColor,size: 25),
  );
}