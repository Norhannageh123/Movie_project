import 'package:flutter/material.dart';
import 'package:movie_app/utils/app_style.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("SearchTab",style:AppStyle.yellow20Bold)),
    );
  }
}