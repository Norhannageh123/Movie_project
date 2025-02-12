import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/feature/custom_widgets/custom_container_rate.dart';
import 'package:movie_app/feature/custom_widgets/custom_elevated_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments)as int;
    print("Movie id $arguments");

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(AppImages.detailsPerson),
                Positioned(
                  top: height * 0.05,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined)),
                ),
                Positioned(
                  top: height * 0.06,
                  right: width * 0.03,
                  child: InkWell(child: Image.asset(AppImages.saveIcon),
                    onTap: (){
                    ///caching this movie
                      ///first i should have an object of this movie
                      ///then save object in hive
                      ///return this in profile ->>save
                    },
                  ),

                ),
                Positioned(
                  top: height * 0.13,
                  right: width * 0.1,
                  left: width * 0.1,
                  child:
                      InkWell(child: Image.asset(AppImages.logoDetailsScreen)),
                ),
                Positioned(
                   top: height * 0.6,
                  right: width * 0.15,
                  left: width * 0.2,
                  child: Text(
                    "Doctor Strange in the \n Multiverse of Madness",
                    style: AppStyle.white24Bold,
                  ),
                ),
                Positioned(
                   top: height * 0.68,
                  right: width * 0.3,
                  left: width * 0.4,
                  child: Text(
                    "2022",
                    style: AppStyle.white20Regular,
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.005,),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: width*0.03
              ),
              child: CustomElevatedButton(
                    onClickedButton: () {},
                    bgColor: AppColors.redColor,
                    text: AppLocalizations.of(context)!.watch,
                    textStyle: AppStyle.white20Regular,
                    borderColor: AppColors.redColor,
                  ),
            ),
             SizedBox(height: height*0.02,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 CustomContainerRate(image: AppImages.heartIcon,text: "15",),
                 CustomContainerRate(image: AppImages.clockIcon,text: "90",),
                CustomContainerRate(image: AppImages.starIcon,text: "7.5",),
              ],
             ),
            SizedBox(height: height*0.02,),
            Text(AppLocalizations.of(context)!.genres,style: AppStyle.white24Bold,),
            // genres
            SizedBox(
              height: height*0.2,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width*0.02,
                      vertical: height*0.005,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: width*0.02,
                      //vertical: height*0.02,
                    ),
                    width: width*0.25,
                    decoration: BoxDecoration(
                      color: AppColors.babyBlackColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Romance',
                        style: AppStyle.white14Regular,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height*0.02,),
             ////////////////Screenshot
          ],
        ),
      ),
    );
  }
}
