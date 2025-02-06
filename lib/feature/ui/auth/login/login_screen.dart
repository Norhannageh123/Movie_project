import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/cubit_language/cubit_language.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/core/utils/app_validator.dart';
import 'package:movie_app/feature/custom_widgets/alert_dialoge.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/login_state.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Register/register.dart';
import '../forget_password/forget_password_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool seenPassword = true;

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    
    
    final language = context.watch<LanguageCubit>().state;

    return BlocListener<LoginViewModel, LoginState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogeUtls.showLoading(context: context, message: AppLocalizations.of(context)!.loading);
        } else if (state is LoginErrorState) {
          DialogeUtls.hideLoading(context: context);
          DialogeUtls.showMessage(
            context: context,
            message: state.error.errorMessage,
            title: AppLocalizations.of(context)!.error,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () {
             // Navigator.of(context).pop();
            },
            negActionName: AppLocalizations.of(context)!.cancel,
            negAction: () {
             // Navigator.of(context).pop();
            },
          );
        } else if (state is LoginSuccessState) {
          DialogeUtls.hideLoading(context: context);
          DialogeUtls.showMessage(
            context: context,
            message: AppLocalizations.of(context)!.login_successfully,
            title: AppLocalizations.of(context)!.success,
            posActionName:AppLocalizations.of(context)!.ok,
            posAction: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            },
            negActionName: AppLocalizations.of(context)!.cancel,
            negAction: () {
             // Navigator.of(context).pop();
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
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
                  CustomTextField(
                    prefixIcon: Image(image: AssetImage(AppImages.emailIcon)),
                    hintText: AppLocalizations.of(context)!.email,
                    hintStyle: AppStyle.white16Regular,
                    style: AppStyle.white16Regular,
                    bgColor: AppColors.babyBlackColor,
                    keyboardTybe: TextInputType.emailAddress,
                    controller: viewModel.emailController,
                    validator: (val) => AppValidator.validateEmail(val, context),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CustomTextField(
                    hintText: AppLocalizations.of(context)!.password,
                    prefixIcon: Image(image: AssetImage(AppImages.passwordIcon)),
                    hintStyle: AppStyle.white16Regular,
                    style: AppStyle.white16Regular,
                    bgColor: AppColors.babyBlackColor,
                    keyboardTybe: TextInputType.text,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          seenPassword = !seenPassword;
                        });
                      },
                      child: seenPassword == true
                          ? Image(image: AssetImage(AppImages.eyeIcon))
                          : Icon(
                              Icons.remove_red_eye,
                              color: AppColors.whiteColor,
                              size: 27,
                            ),
                    ),
                    controller: viewModel.passwordController,
                    obscureText: !seenPassword,
                    validator: (val) => AppValidator.validatePassword(val, context),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                          );
                        },
                        child: Text(
                            AppLocalizations.of(context)!.forget_password,
                            style: AppStyle.yellow14Regular),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CustomElevatedButton(
                    onClickedButton: () {
                      viewModel.login();
                    },
                    bgColor: AppColors.yellowColor,
                    text: AppLocalizations.of(context)!.login,
                    textStyle: AppStyle.black20SemiBoldInter,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.do_not_have_account,
                          style: AppStyle.white16Regular),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.create_one,
                            style: AppStyle.yellow14Bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
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
                    height: height * 0.02,
                  ),
                  CustomElevatedButton(
                    onClickedButton: () {
                      // Handle Google login logic here
                    },
                    bgColor: AppColors.yellowColor,
                    text: AppLocalizations.of(context)!.login_with_google,
                    prefixIcon: Image(image: AssetImage(AppImages.googleIcon)),
                    textStyle: AppStyle.black20SemiBoldInter,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
