import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/feature/custom_widgets/custom_text_field.dart';
import 'package:movie_app/feature/ui/home/tabs/search_tab/cubit/search_tab_state.dart';
import 'package:movie_app/feature/ui/home/tabs/search_tab/movie_poster_widget.dart';
import '../../../../../core/di/inject.dart';
import '../../../../../domain/search_tab/SearchTabEntity.dart';
import 'cubit/search_tab_view_model.dart';

class SearchTab extends StatelessWidget {
  SearchTabViewModel searchTabViewModel=getIt<SearchTabViewModel>();
 Timer? _debounce;

  SearchTab({super.key});

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
                controller: searchTabViewModel.movieTitle,
                onchanged: (text){
                  if(text.isEmpty){
                    searchTabViewModel.searchMoviesList.data?.movies=[];
                    return  Center(child:Image.asset(AppImages.searchImage) ,);

                  }else
                  searchTabViewModel.getSearchMoviesList(text);
                },
                keyboardTybe: TextInputType.text,
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Image.asset(AppImages.searchWhite),
              ),
              BlocBuilder<SearchTabViewModel, SearchTabState>(
                bloc: searchTabViewModel..getSearchMoviesList(''),
               builder: (context, state) {
                  if (state is SearchTabErrorState) {
                  return Center(child: Text(state.failures.errorMessage),);
                  } else if (state is SearchTabLoadingState) {
                  return CircularProgressIndicator();
                  } else if (state is SearchTabSuccessState) {

                 return state.searchTabResponseEntity.data?.movies==[]  ?
                 Center(child:Image.asset(AppImages.searchImage) ,):
                 Expanded(
                child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,//
                    childAspectRatio: 0.7, // Number of columns
                  ),
                  itemBuilder: (context, index) {
                    MoviesSearchEntity? movie =  searchTabViewModel.searchMoviesList.data?.movies?[index] ;
                    if(movie!=null){
                      return MoviePoster(moviesSearchList:  movie,);
                    }else{
                      return Center( );
                    }
                  },
                  itemCount: searchTabViewModel.searchMoviesList.data?.movies?.length,
                ),
                 );} else {
                    return Container();
                  }
                  },
                ),


            ],
          ),
        ),
      ),
    );


  }
}