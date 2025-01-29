import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_style.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("BrowseTab",style:AppStyle.yellow20Bold)),
    );
  }
}