import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_field.dart';

import '../../Utls/app_colors.dart';
import '../../Utls/app_images.dart';
import '../../Utls/app_style.dart';

class Register extends StatefulWidget {
  static const String registerRoute = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isSelected = true;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> avatars = [
      'assets/images/avatar_1.png',
      'assets/images/avatar_2.png',
      'assets/images/avatar_3.png',
      'assets/images/avatar_4.png',
      'assets/images/avatar_5.png',
      'assets/images/avatar_6.png',
      'assets/images/avatar_7.png',
      'assets/images/avatar_8.png',
      'assets/images/avatar_9.png',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register,
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
            child: Column(
              spacing: height * 0.0128,
              children: [
                CarouselSlider.builder(
                  itemCount: avatars.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Image.asset(
                    avatars[itemIndex],
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    enableInfiniteScroll: false,
                    height: height * 0.172,
                    initialPage: 1,
                    enlargeCenterPage: true,
                    viewportFraction: .4,
                    enlargeFactor: .5,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.avatar,
                  style: AppStyle.white16Regular,
                ),
                Column(
                  spacing: height * 0.0257,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.name,
                      prefixIcon: Image.asset(AppImages.userIcon),
                    ),
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Image.asset(AppImages.emailIcon),
                    ),
                    CustomTextField(
                      obscureText: obscurePassword,
                      hintText: AppLocalizations.of(context)!.password,
                      prefixIcon: Image.asset(
                        AppImages.passwordIcon,
                      ),
                      suffixIcon: InkWell(
                        overlayColor:
                            WidgetStatePropertyAll(AppColors.transparentColor),
                        onTap: () {
                          obscurePassword = !obscurePassword;
                          setState(() {});
                        },
                        child: obscurePassword == true
                            ? Image.asset(AppImages.eyeIcon)
                            : Icon(
                                CupertinoIcons.eye_fill,
                                color: Colors.white,
                                size: 26,
                              ),
                      ),
                    ),
                    CustomTextField(
                      obscureText: obscureConfirmPassword,
                      hintText: AppLocalizations.of(context)!.confirm_password,
                      prefixIcon: Image.asset(
                        AppImages.passwordIcon,
                      ),
                      suffixIcon: InkWell(
                        overlayColor:
                            WidgetStatePropertyAll(AppColors.transparentColor),
                        onTap: () {
                          obscureConfirmPassword = !obscureConfirmPassword;
                          setState(() {});
                        },
                        child: obscureConfirmPassword == true
                            ? Image.asset(AppImages.eyeIcon)
                            : Icon(
                                CupertinoIcons.eye_fill,
                                color: Colors.white,
                                size: 26,
                              ),
                      ),
                    ),
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.phone_number,
                      prefixIcon: Image.asset(AppImages.phoneIcon),
                    ),
                    CustomElevatedButton(
                        text: AppLocalizations.of(context)!.create_account,
                        onClickedButton: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.already_have_account,
                      style: AppStyle.white14Regular,
                    ),
                    CustomElevatedButton(
                      padding: EdgeInsets.zero,
                      bgColor: AppColors.transparentColor,
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      textStyle: AppStyle.yellow14Black,
                      text: AppLocalizations.of(context)!.login,
                      onClickedButton: () {},
                    ),
                  ],
                ),
                Container(
                  width: width * 0.214,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: AppColors.yellowColor, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          isSelected = true;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.yellowColor
                                    : AppColors.transparentColor,
                                width: 4,
                              )),
                          child: Image.asset(
                            AppImages.americanIcon,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isSelected = false;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.transparentColor
                                    : AppColors.yellowColor,
                                width: 4,
                              )),
                          child: Image.asset(
                            AppImages.egyptIcon,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
