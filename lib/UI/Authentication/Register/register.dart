import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_field.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_style.dart';
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
              children: [
                Column(
                  //spacing: height * 0.0257,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .044,
                    ),
                    Image.asset(
                      AppImages.logo,
                      width: width * 0.2813,
                      height: height * 0.1266,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
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
                        onClickedButton: () {

                        }),
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
                        onTap: (){
                          isSelected = true;
                          setState(() {
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected?AppColors.yellowColor: AppColors.transparentColor,
                                width: 4,
                              )),
                          child: Image.asset(
                            AppImages.americanIcon,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          isSelected = false;
                          setState(() {
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected?AppColors.transparentColor: AppColors.yellowColor,
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
