import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/ui/home/tabs/search_tab/cubit/search_tab_state.dart';
import '../../../../../../domain/search_tab/SearchTabEntity.dart';
import '../../../../../../domain/search_tab/search_tab_use_case.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabState>{
  SearchTabUseCase searchTabUseCase;
  var movieTitle = TextEditingController();
  SearchTabViewModel({required this.searchTabUseCase}):super(SearchTabInitialState());
  SearchTabResponseEntity searchMoviesList=SearchTabResponseEntity();
  Timer? _debounce;

  void getSearchMoviesList(movieTitle)async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(Duration(milliseconds: 500), ()async {
    emit(SearchTabLoadingState());
    var result = await searchTabUseCase.invoke(movieTitle);
    result.fold((error) => emit(SearchTabErrorState(failures: error)),
            (searchTabResponseEntity) {
              searchMoviesList = searchTabResponseEntity;
          emit(SearchTabSuccessState(searchTabResponseEntity: searchTabResponseEntity));
        });
    });
  }
}