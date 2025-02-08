import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/usecases/home_use_case.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/cubit/home_state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{
  ///handel logic , hold data
  HomeUseCase homeUseCase;
  HomeViewModel({required this.homeUseCase}):super(HomeLoadingState());
   MoviesListEntity moviesList=MoviesListEntity();

   MoviesListEntity moviesFilterGenreList=MoviesListEntity();
   List<String> genre=["Comedy","Romance","Action","Drama", "Horror", "Thriller"];

  void getMoviesList()async {
    emit(HomeLoadingState());
    var result = await homeUseCase.invoke();
    result.fold((error) => emit(HomeErrorState(failures: error)),
            (moviesListEntity) {
          moviesList = moviesListEntity;
          emit(HomeSuccessState(moviesListEntity: moviesListEntity));
        });
  }
  void getFilterGenreMoviesList()async {
    emit(HomeLoadingState());

    var result = await homeUseCase.invokeFilter(genre[Random().nextInt(genre.length)]);
    result.fold((error) => emit(HomeErrorState(failures: error)),
            (moviesListEntity) {

              moviesFilterGenreList = moviesListEntity;
          emit(HomeSuccessState(moviesListEntity: moviesListEntity));
        });
  }
}