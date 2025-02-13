import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_validator.dart';
import '../../../custom_widgets/alert_dialoge.dart';
import '../login/cubit/token_manager.dart';
import 'cubit/reset_state.dart';
import 'cubit/reset_view_model.dart';

@injectable
class ResetPasswordScreen extends StatefulWidget {
  // static const String resetPasswordRoute = 'reset_password';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  ResetViewModel viewModel = getIt<ResetViewModel>();
  final TokenManager tokenManager = GetIt.instance<TokenManager>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<ResetViewModel, ResetState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetLoadingState) {
          DialogeUtls.showLoading(context: context, message: AppLocalizations.of(context)!.loading);
        } else if (state is ResetErrorState) {
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
        } else if (state is ResetSuccessState) {
          DialogeUtls.hideLoading(context: context);
          DialogeUtls.showMessage(
            context: context,
            message: AppLocalizations.of(context)!.confirm_password,
            title: AppLocalizations.of(context)!.success,
            posActionName:AppLocalizations.of(context)!.ok,
            posAction: () {
              print('Token ${tokenManager.getToken()}');
              Navigator.of(context).pushNamed(AppRoutes.updateProfileRoute);
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
          title: Text(AppLocalizations.of(context)!.reset_password,style: AppStyle.yellow14Regular,),
          iconTheme: IconThemeData(color:AppColors.yellowColor),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: SingleChildScrollView(
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  Image.asset(AppImages.forgetPassword),
                  CustomTextField(
                    controller: viewModel.newPasswordController,
                    hintText: AppLocalizations.of(context)!.confirm_password,
                    prefixIcon: Image(image: AssetImage(AppImages.passwordIcon)),
                    hintStyle: AppStyle.white16Regular,
                    style: AppStyle.white16Regular,
                    bgColor: AppColors.babyBlackColor,
                    keyboardTybe: TextInputType.text,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          setState(() => obscureOldPassword = !obscureOldPassword);
                        });
                      },
                      child: Icon(
                        obscureOldPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.white,
                      ),
                    ),
                    // controller: viewModel.passwordController,
                    obscureText: obscureOldPassword,
                    validator: (val) => AppValidator.validatePassword(val, context),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    controller: viewModel.oldPasswordController,
                    hintText: AppLocalizations.of(context)!.confirm_password,
                    prefixIcon: Image(image: AssetImage(AppImages.passwordIcon)),
                    hintStyle: AppStyle.white16Regular,
                    style: AppStyle.white16Regular,
                    bgColor: AppColors.babyBlackColor,
                    keyboardTybe: TextInputType.text,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(
                                () => obscureNewPassword = !obscureNewPassword);
                      },

                      child: Icon(
                        obscureNewPassword
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye,
                        color: Colors.white,
                      ),
                    ),
                    // controller: viewModel.passwordController,
                    obscureText: !obscureNewPassword,
                    validator: (val) => AppValidator.validatePassword(val, context),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomElevatedButton(
                      text: AppLocalizations.of(context)!.confirm_password,
                      textStyle: AppStyle.black20Regular,
                      onClickedButton: () {
                        viewModel.reset();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}