import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.0372),
          child: Column(
            children: [
              CustomTextField(
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Image.asset(AppImages.searchWhite),
              ),
              Expanded(child: Image.asset(AppImages.searchImage))
            ],
          ),
        ),
      ),
    );
  }
}