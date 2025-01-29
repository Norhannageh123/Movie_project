import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_style.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("HomeTab",style:AppStyle.yellow20Bold)),
    );
  }
}