import 'package:flutter/material.dart';
import 'package:movie_app/Utls/app_colors.dart';
// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  String text;
  Color? bgColor;
  Widget? prefixIcon;
  TextStyle? textStyle;
  Function onClickedButton;
 CustomElevatedButton({super.key,required this.text,this.bgColor,this.prefixIcon,this.textStyle,required this.onClickedButton});
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                
                padding: EdgeInsets.symmetric(
                  horizontal: width*0.04,
                  vertical: height*0.02,
                ),
                backgroundColor:bgColor??AppColors.yellowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: AppColors.yellowColor,
                    width: 2,
                  )
                ),
                
              ),
              onPressed: (){
                onClickedButton();
              },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prefixIcon??const SizedBox(),
                  SizedBox(width: width*0.02,),
                  Text(text,style: textStyle,),
                ],
               ),
               );
  }
}