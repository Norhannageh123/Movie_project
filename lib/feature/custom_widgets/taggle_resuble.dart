import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cubit_language/cubit_language.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleReusable extends StatefulWidget {
  const ToggleReusable({super.key});

  @override
  State<ToggleReusable> createState() => _ToggleReusableState();
}

class _ToggleReusableState extends State<ToggleReusable> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var language = context.watch<LanguageCubit>().state; 

    return Center(
      child: ToggleSwitch(
        borderColor: [AppColors.yellowColor],
        minWidth: width * 0.13,
        initialLabelIndex: language == 'en' ? 0 : 1,
        cornerRadius: 25.0,
        totalSwitches: 2,
        activeBgColor: [AppColors.yellowColor],
        iconSize: 35,
        curve: Curves.bounceInOut,
        changeOnTap: true,
        inactiveBgColor: AppColors.transparentColor,
        customWidgets: [
          Image(image: AssetImage(AppImages.americanIcon)),
          Image(image: AssetImage(AppImages.egyptIcon)),
        ],
        onToggle: (index) {
          final newLanguage = index == 0 ? 'en' : 'ar';
          context.read<LanguageCubit>().changeLanguage(newLanguage);
        },
      ),
    );
  }
}
