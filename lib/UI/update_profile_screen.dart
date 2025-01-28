import 'package:flutter/material.dart';
import 'package:movie_app/Utls/app_images.dart';
import 'package:movie_app/Utls/app_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Utls/app_colors.dart';
import '../custom_widgets/custom_elevated_button.dart';
import '../custom_widgets/custom_text_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          centerTitle: true,
          title: Text(AppLocalizations.of(context)!.edit_profile, style: AppStyle.yellow15Regular),
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
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTextField(
                  controller: nameController,
                  prefixIcon: const Image(
                    image: AssetImage(AppImages.personIcon),
                  ),
                  hintText: AppLocalizations.of(context)!.name,
                  hintStyle: AppStyle.white20Regular,
                  style: AppStyle.white20Regular,
                  keyboardTybe: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  prefixIcon: const Image(
                    image: AssetImage(AppImages.phoneIcon),
                  ),
                  hintText: AppLocalizations.of(context)!.phone_number,
                  hintStyle: AppStyle.white20Regular,
                  style: AppStyle.white20Regular,
                  keyboardTybe: TextInputType.phone,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // todo: navigate to forget password screen
                      },
                      child: Text(AppLocalizations.of(context)!.reset_password,
                          style: AppStyle.white20Regular),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.2,
                ),
                CustomElevatedButton(
                  onClickedButton: () {},
                  bgColor: AppColors.redColor,
                  text: AppLocalizations.of(context)!.delete_account,
                  textStyle: AppStyle.white20Regular,
                ),
                SizedBox(
                  height: height * .02,
                ),
                CustomElevatedButton(
                  onClickedButton: () {},
                  bgColor: AppColors.yellowColor,
                  text: AppLocalizations.of(context)!.update_data,
                  textStyle: AppStyle.black20Regular,
                ),
                SizedBox(
                  height: height * .02,
                ),
              ],
            ),
          ),
        ));
  }

  void pickAvatar(int index) {
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height*.45,
          maxWidth: MediaQuery.of(context).size.width*.9,
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
              shrinkWrap: true, // This is crucial for proper bottom alignment
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: imagePath.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    selectedIndex = index;
                    print('index = $index');
                    print('selectedIndex = $selectedIndex');
                    Navigator.pop(context);
                    setState(() {

                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 2,right: 3),
                    margin: EdgeInsets.only(left: 2,right: 3),
                    height: 105,
                    width: 108,
                    child: Image.asset(imagePath[index]),
                    decoration: BoxDecoration(
                        color: selectedIndex == index ? AppColors.yellowColor:
                        AppColors.transparentColor,
                        /*index != selectedIndex? Colors.transparent:
                        AppColors.yellowColor,*/
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.yellowColor)),
                  ),
                );
              },
            ),
          );
        });
    setState(() {

    });
  }
}
