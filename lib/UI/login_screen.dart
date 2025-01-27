import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/Utls/app_colors.dart';
import 'package:movie_app/Utls/app_style.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../Utls/app_images.dart';
import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool seenPassword = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: AssetImage(AppImages.logo),
                  width: width * 0.1,
                  height: height * 0.15,
                ),
                SizedBox(
                  height: height * 0.05,
                ),

                // email
                CustomTextField(
                  prefixIcon: Image(
                    image: AssetImage(AppImages.emailIcon),
                  ),
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: AppStyle.white16Regular,
                  borderColor: AppColors.transparentColor,
                  style: AppStyle.white16Regular,
                  keyboardTybe: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter email";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return "please enter valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),

                // password
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Image(
                    image: AssetImage(AppImages.passwordIcon),
                  ),
                  hintStyle: AppStyle.white16Regular,
                  borderColor: AppColors.transparentColor,
                  style: AppStyle.white16Regular,
                  keyboardTybe: TextInputType.text,
                  suffixIcon: InkWell(
                    onTap: () {
                      if (seenPassword == true) {
                        seenPassword = false;
                      } else {
                        seenPassword = true;
                      }

                      setState(() {});
                    },
                    child: seenPassword == true
                        ? Image(image: AssetImage(AppImages.eyeIcon))
                        : Icon(
                            Icons.remove_red_eye,
                            color: AppColors.whiteColor,
                            size: 27,
                          ),
                  ),
                  controller: passwordController,
                  obscureText: seenPassword == false ? true : false,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter the Password";
                    }
                    if (text.length < 6) {
                      return " Password should be more than 6 chars";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.01,
                ),

                // forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // todo: navigate to forget password screen
                      },
                      child: Text(AppLocalizations.of(context)!.forget_password,
                          style: AppStyle.yellow14Regular),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .03,
                ),

                // login
                CustomElevatedButton(
                  onClickedButton: () {
                    // todo: navigation
                    if (formKey.currentState?.validate() == true) {
                      print('valid');
                    } else {
                      print('not valid');
                    }
                  },
                  bgColor: AppColors.yellowColor,
                  text: AppLocalizations.of(context)!.login,
                  textStyle: AppStyle.black20SemiBoldInter,
                ),
                SizedBox(
                  height: height * .02,
                ),

                // create account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.do_not_have_account,
                        style: AppStyle.white16Regular),
                    InkWell(
                      onTap: () {},
                      child: Text(AppLocalizations.of(context)!.create_one,
                          style: AppStyle.yellow14Bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),

                // divider
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: AppColors.yellowColor,
                        endIndent: width * 0.02,
                        indent: width * 0.12,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.or,
                      style: AppStyle.yellow14Regular,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.5,
                        color: AppColors.yellowColor,
                        indent: width * 0.02,
                        endIndent: width * 0.12,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),

                // login with google
                CustomElevatedButton(
                  onClickedButton: () {
                    // todo: navigation
                  },
                  bgColor: AppColors.yellowColor,
                  text: AppLocalizations.of(context)!.login_with_google,
                  prefixIcon: Image(image: AssetImage(AppImages.googleIcon)),
                  textStyle: AppStyle.black20SemiBoldInter,
                ),
                SizedBox(
                  height: height * .02,
                ),

                // language
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
