import 'package:flutter/material.dart';
import 'package:movie_app/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/custom_widgets/custom_text_field.dart';
import 'package:movie_app/utils/app_images.dart';
import 'package:movie_app/utils/app_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String forgetPasswordRoute = 'forget_password';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forget Password'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppImages.forgetPassword),
                CustomTextField(
                  hintText: "Email",
                  style: AppStyle.white16Regular,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                ),
                SizedBox(
                  height: height * .02,
                ),
                CustomElevatedButton(
                    text: "Verify Email",
                    textStyle: AppStyle.black20Regular,
                    onClickedButton: () {})
              ],
            ),
          ),
        ));
  }
}
