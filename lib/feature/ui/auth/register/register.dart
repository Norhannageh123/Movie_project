import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/core/utils/app_validator.dart';
import 'package:movie_app/feature/custom_widgets/alert_dialoge.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:movie_app/feature/custom_widgets/taggle_resuble.dart';
import 'package:movie_app/feature/custom_widgets/toast.dart';
import 'package:movie_app/feature/ui/auth/login/login_screen.dart';
import 'package:movie_app/feature/ui/auth/register/cubit/register_state.dart';
import 'package:movie_app/feature/ui/auth/register/cubit/register_view_model.dart';

class Register extends StatefulWidget {
  static const String registerRoute = "register";

  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  late RegisterViewModel viewModel=getIt<RegisterViewModel>();

  @override
  void initState() {
    super.initState();

  }

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

    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterInitState) {
          // print("Init");
          // DialogeUtls.showLoading(
          //     context: context, message: AppLocalizations.of(context)!.loading);
        } else if (state is RegisterErrorState) {
          print("errorrrrr");
          print(state.error.errorMessage);
          // DialogeUtls.hideLoading(context: context);
          // DialogeUtls.showMessage(
          //     context: context,
          //     message: state.error.errorMessage,
          //     title: AppLocalizations.of(context)!.error,
          //     // posActionName: AppLocalizations.of(context)!.ok,
          //     // Action: (){
          //     //   Navigator.of(context, rootNavigator: true).pop();
          //     // },
          //
          //     negActionName: "cancel"
          // );
          ToastHelper.showErrorToast( state.error.errorMessage);
        } else if (state is RegisterSuccessState) {
          print("success");
          ToastHelper.showErrorToast("Register Success");
          Navigator.of(context)
                       .pushReplacementNamed(AppRoutes.homeRoute);
          // DialogeUtls.hideLoading(context: context);
          // DialogeUtls.showMessage(
          //   context: context,
          //   message: AppLocalizations.of(context)!.login_successfully,
          //   title: AppLocalizations.of(context)!.success,
          //   posActionName: AppLocalizations.of(context)!.ok,
          //   posAction: () {
          //     Future.delayed(Duration(milliseconds: 300), () {
          //       if (mounted) {
          //         Navigator.of(context)
          //             .pushReplacementNamed(AppRoutes.homeRoute);
          //       }
          //     });
          //   },
          // );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.register),
          iconTheme: IconThemeData(color: AppColors.yellowColor),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: avatars.length,
                  itemBuilder: (context, index, _) => GestureDetector(
                    onTap: () {
                      context.read<RegisterViewModel>().setAvatarId(index + 1);
                    },
                    child: Image.asset(
                      avatars[index],
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
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
                  controller: viewModel.userNameController,
                  validator: (val) =>
                      AppValidator.validateUserName(val, context),
                  hintText: AppLocalizations.of(context)!.name,
                  prefixIcon: Image.asset(AppImages.userIcon),
                ),
                SizedBox(height: height * 0.0257),
                CustomTextField(
                  controller: viewModel.emailController,
                  validator: (val) => AppValidator.validateEmail(val, context),
                  hintText: AppLocalizations.of(context)!.email,
                  prefixIcon: Image.asset(AppImages.emailIcon),
                ),
                SizedBox(height: height * 0.0257),
                CustomTextField(
                  controller: viewModel.passwordController,
                  validator: (val) =>
                      AppValidator.validatePassword(val, context),
                  obscureText: obscurePassword,
                  hintText: AppLocalizations.of(context)!.password,
                  prefixIcon: Image.asset(AppImages.passwordIcon),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscurePassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.white),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.0257),
                CustomTextField(
                  controller: viewModel.rePasswordController,
                  validator: (val) => AppValidator.validateConfirmPassword(
                      val, viewModel.passwordController.text, context),
                  obscureText: obscureConfirmPassword,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                  prefixIcon: Image.asset(AppImages.passwordIcon),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureConfirmPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.white),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                SizedBox(height: height * 0.0257),
                CustomTextField(
                  controller: viewModel.phoneNumberController,
                  validator: (val) =>
                      AppValidator.validatePhoneNumber(val, context),
                  hintText: AppLocalizations.of(context)!.phone_number,
                  prefixIcon: Image.asset(AppImages.phoneIcon),
                ),
                SizedBox(height: height * 0.0257),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.create_account,
                  onClickedButton: () {
                    viewModel.register();
                  },
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
                ToggleReusable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
