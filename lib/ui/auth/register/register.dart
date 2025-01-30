
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_field.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_style.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../Login/login_screen.dart';
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
        iconTheme: IconThemeData(color: AppColors.yellowColor),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
            child: Column(
              //spacing: height * 0.0128,
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
                    enableInfiniteScroll: false,
                    height: height * 0.172,
                    initialPage: 1,
                    enlargeCenterPage: true,
                    viewportFraction: .4,
                    enlargeFactor: .5,
                  ),
                ),
                SizedBox(height: height * 0.0128,),
                Text(
                  AppLocalizations.of(context)!.avatar,
                  style: AppStyle.white16Regular,
                ),
                Column(
                 // spacing: height * 0.0257,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.name,
                      prefixIcon: Image.asset(AppImages.userIcon),
                    ),
                    SizedBox(height: height * 0.0257,),
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.email,
                      prefixIcon: Image.asset(AppImages.emailIcon),
                    ),
                     SizedBox(height: height * 0.0257,),
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
                     SizedBox(height: height * 0.0257,),
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
                     SizedBox(height: height * 0.0257,),
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.phone_number,
                      prefixIcon: Image.asset(AppImages.phoneIcon),
                    ),
                     SizedBox(height: height * 0.0257,),
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
                     SizedBox(height: height * 0.0257,),
                    CustomElevatedButton(
                      padding: EdgeInsets.zero,
                      bgColor: AppColors.transparentColor,
                      borderSide: BorderSide(color: AppColors.transparentColor),
                      textStyle: AppStyle.yellow14Black,
                      text: AppLocalizations.of(context)!.login,
                      onClickedButton: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
                 SizedBox(height: height * 0.0257,),
                    Center(
                  child: ToggleSwitch(
                    borderColor: [AppColors.yellowColor],
                    minWidth: width * 0.13,
                    initialLabelIndex: 1,
                    cornerRadius: 25.0,
                    totalSwitches: 2,
                    activeBgColor: [
                      AppColors.yellowColor,
                    ],
                    iconSize: 35,
                    curve: Curves.bounceInOut,
                    changeOnTap: true,
                    inactiveBgColor: AppColors.transparentColor,
                    customWidgets: [
                      Image(
                        image: AssetImage(
                          AppImages.americanIcon,
                        ),
                      ),
                      Image(
                          image: AssetImage(
                        AppImages.egyptIcon,
                      )),
                    ],
                    onToggle: (index) {
                      if (index == 0) {
                      } else {}
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}