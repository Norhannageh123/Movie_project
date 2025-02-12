import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/alert_dialoge.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_state.dart';
import '../../core/di/inject.dart';
import 'auth/forget_password/forget_password_screen.dart';
import 'home/tabs/profile_tab/cubit/edite_profile_view_model.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  EditeProfileViewModel editeProfileViewModel = getIt<EditeProfileViewModel>();
  int selectedIndex = 0;
  List<String> imagePath = [
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
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<EditeProfileViewModel, EditProfileState>(
      bloc: editeProfileViewModel,
      listener: (context, state) {
        if (state is EditProfileLoading) {
          DialogeUtls.showLoading(context: context, message: AppLocalizations.of(context)!.loading);
        } else if (state is EditProfileError) {
          DialogeUtls.hideLoading(context: context);
          DialogeUtls.showMessage(
            context: context,
            message: state.errorMessage,
            title: AppLocalizations.of(context)!.error,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () {
              // Handle the action
            },
            negActionName: AppLocalizations.of(context)!.cancel,
            negAction: () {
              // Handle the action
            },
          );
        } else if (state is EditProfileSuccess) {
          DialogeUtls.hideLoading(context: context);
          DialogeUtls.showMessage(
            context: context,
            message: AppLocalizations.of(context)!.login_successfully,
            title: AppLocalizations.of(context)!.success,
            posActionName: AppLocalizations.of(context)!.ok,
            posAction: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            },
            negActionName: AppLocalizations.of(context)!.cancel,
            negAction: () {
              // Handle the action
            },
          );
        } else if (state is DeleteAccountError || state is DeleteAccountSuccess) {
          DialogeUtls.hideLoading(context: context);
          // Handle delete account feedback (if needed)
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.edit_profile, style: AppStyle.yellow15Regular),
          iconTheme: IconThemeData(color: AppColors.yellowColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    pickAvatar(selectedIndex);
                  },
                  child: CircleAvatar(
                    radius: 40,
                    child: Image.asset(
                      imagePath[selectedIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                CustomTextField(
                  controller: nameController,
                  prefixIcon: const Image(image: AssetImage(AppImages.personIcon)),
                  hintText: AppLocalizations.of(context)!.name,
                  hintStyle: AppStyle.white20Regular,
                  style: AppStyle.white20Regular,
                  keyboardTybe: TextInputType.emailAddress,
                ),
                SizedBox(height: height * 0.03),
                CustomTextField(
                  controller: phoneNumberController,
                  prefixIcon: const Image(image: AssetImage(AppImages.phoneIcon)),
                  hintText: AppLocalizations.of(context)!.phone_number,
                  hintStyle: AppStyle.white20Regular,
                  style: AppStyle.white20Regular,
                  keyboardTybe: TextInputType.phone,
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.reset_password, style: AppStyle.white20Regular),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.2),
                CustomElevatedButton(
                  onClickedButton: () {
                    editeProfileViewModel.deleteAccount();
                  },
                  bgColor: AppColors.redColor,
                  text: AppLocalizations.of(context)!.delete_account,
                  textStyle: AppStyle.white20Regular,
                  borderColor: AppColors.redColor,
                ),
                SizedBox(height: height * .02),
                CustomElevatedButton(
                  onClickedButton: () {
                    editeProfileViewModel.updateProfile();
                  },
                  bgColor: AppColors.yellowColor,
                  text: AppLocalizations.of(context)!.update_data,
                  textStyle: AppStyle.black20Regular,
                ),
                SizedBox(height: height * .02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickAvatar(int index) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .45,
        maxWidth: MediaQuery.of(context).size.width * .9,
      ),
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.greyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: imagePath.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  selectedIndex = index;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.only(left: 2, right: 3),
                  margin: EdgeInsets.only(left: 2, right: 3),
                  height: 105,
                  width: 108,
                  child: Image.asset(imagePath[index]),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? AppColors.yellowColor : AppColors.transparentColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.yellowColor),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
