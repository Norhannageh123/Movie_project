import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_style.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("ProfileTab",style:AppStyle.yellow20Bold)),
    );
  }
}