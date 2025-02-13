import 'package:bloc/bloc.dart';
import 'package:movie_app/domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import 'package:movie_app/domain/details/movie_suggestions/use_cases/movieSuggestionsUseCase.dart';
import 'package:movie_app/feature/ui/home/details_screen/movies_suggestions/cubit/movies_suggestions_state.dart';

class MovieSuggestionsViewModel extends Cubit<MoviesSuggestionsStates> {
  MovieSuggestionsUseCase  movieSuggestionsUseCase;
  MovieSuggestionsViewModel({required this.movieSuggestionsUseCase}): super(MoviesSuggestionsInitState());
  List<MovieSuggestionsResponseEntity> moviesSuggestionsList = [];

  void getSuggestionsMovies()async {
    int? movieID;
    emit(MoviesSuggestionsStates());
    var either = await movieSuggestionsUseCase.invoke(10);
    either.fold(
      (error){
        emit(MoviesSuggestionsErrorState(error: error));
      },
        (response){
        moviesSuggestionsList = response.data!.movies!.cast<MovieSuggestionsResponseEntity>();
        emit(MoviesSuggestionsSuccessState(response));
        }
    );
}
}