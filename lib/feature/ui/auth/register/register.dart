import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/core/utils/app_validator.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:movie_app/feature/ui/auth/login/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Register extends StatefulWidget {
  static const String registerRoute = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> avatars = [
      AppImages.avatar1,
      AppImages.avatar2,
      AppImages.avatar3,
      AppImages.avatar4,
      AppImages.avatar5,
      AppImages.avatar6,
      AppImages.avatar7,
      AppImages.avatar8,
      AppImages.avatar9,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
        iconTheme: IconThemeData(color: AppColors.yellowColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: avatars.length,
              itemBuilder: (context, index, _) => Image.asset(
                avatars[index],
                height: double.infinity,
                fit: BoxFit.contain,
              ),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                height: height * 0.172,
                enlargeCenterPage: true,
                viewportFraction: .4,
              ),
            ),
            SizedBox(height: height * 0.0128),
            Text(AppLocalizations.of(context)!.avatar,
                style: AppStyle.white16Regular),
            SizedBox(height: height * 0.0257),
            CustomTextField(
              controller: userNameController,
              validator: (val) => AppValidator.validateUserName(val, context),
              hintText: AppLocalizations.of(context)!.name,
              prefixIcon: Image.asset(AppImages.userIcon),
            ),
            SizedBox(height: height * 0.0257),
            CustomTextField(
              controller: emailController,
              validator: (val) => AppValidator.validateEmail(val, context),
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: Image.asset(AppImages.emailIcon),
            ),
            SizedBox(height: height * 0.0257),
            CustomTextField(
              controller: passwordController,
              validator: (val) => AppValidator.validatePassword(val, context),
              obscureText: obscurePassword,
              hintText: AppLocalizations.of(context)!.password,
              prefixIcon: Image.asset(AppImages.passwordIcon),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() => obscurePassword = !obscurePassword);
                },
                child: Icon(
                  obscurePassword
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: height * 0.0257),
            CustomTextField(
              controller: rePasswordController,
              validator: (val) => AppValidator.validateConfirmPassword(
                  val, passwordController.text, context),
              obscureText: obscureConfirmPassword,
              hintText: AppLocalizations.of(context)!.confirm_password,
              prefixIcon: Image.asset(AppImages.passwordIcon),
              suffixIcon: InkWell(
                onTap: () {
                  setState(
                      () => obscureConfirmPassword = !obscureConfirmPassword);
                },
                child: Icon(
                  obscureConfirmPassword
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: height * 0.0257),
            CustomTextField(
              controller: phoneNumberController,
              validator: (val) =>
                  AppValidator.validatePhoneNumber(val, context),
              hintText: AppLocalizations.of(context)!.phone_number,
              prefixIcon: Image.asset(AppImages.phoneIcon),
            ),
            SizedBox(height: height * 0.0257),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.create_account,
              onClickedButton: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.already_have_account,
                    style: AppStyle.white14Regular),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  ),
                  child: Text(AppLocalizations.of(context)!.login,
                      style: AppStyle.yellow14Black),
                ),
              ],
            ),
            ToggleSwitch(
              borderColor: [AppColors.yellowColor],
              minWidth: width * 0.13,
              initialLabelIndex: 1,
              cornerRadius: 25.0,
              totalSwitches: 2,
              activeBgColor: [AppColors.yellowColor],
              inactiveBgColor: AppColors.transparentColor,
              customWidgets: [
                Image.asset(AppImages.americanIcon),
                Image.asset(AppImages.egyptIcon),
              ],
              onToggle: (index) => print('Switched to: $index'),
            ),
          ],
        ),
      ),
    );
  }
}
