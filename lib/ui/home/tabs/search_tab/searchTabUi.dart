import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/custom_widgets/custom_text_field.dart';
import 'package:movie_app/utils/app_images.dart'; 

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextField(
              hintText: AppLocalizations.of(context)!.search,
              prefixIcon: Image.asset(AppImages.searchWhite), 
            ),
            Expanded(child: Image.asset(AppImages.searchImage)) 
          ],
        ),
      ),
    );
  }
}