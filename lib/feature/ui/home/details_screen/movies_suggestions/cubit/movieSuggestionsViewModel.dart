/*
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import 'package:movie_app/domain/details/movie_suggestions/use_cases/movieSuggestionsUseCase.dart';
import 'package:movie_app/feature/ui/home/details_screen/movies_suggestions/cubit/movies_suggestions_state.dart';
@injectable
class MovieSuggestionsViewModel extends Cubit<MoviesSuggestionsStates> {
  MovieSuggestionsUseCase  movieSuggestionsUseCase;
  MovieSuggestionsViewModel({required this.movieSuggestionsUseCase}): super(MoviesSuggestionsInitState());
  MovieSuggestionsResponseEntity movieSuggestionsResponseEntity = MovieSuggestionsResponseEntity();
  List<MovieSuggestionsResponseEntity> moviesSuggestionsList = [];

  void getSuggestionsMovies(int movieID)async {
    emit(MoviesSuggestionsStates());
    var either = await movieSuggestionsUseCase.invoke(movieID);
    either.fold(
      (error){
        emit(MoviesSuggestionsErrorState(error: error));
      },
        (response){
        moviesSuggestionsList = response as List<MovieSuggestionsResponseEntity>;
        emit(MoviesSuggestionsSuccessState(response));
        }
    );
}
}*/
