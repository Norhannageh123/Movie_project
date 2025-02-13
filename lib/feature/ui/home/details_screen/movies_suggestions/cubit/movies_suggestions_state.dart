import 'package:movie_app/domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import '../../../../../../core/errors/failures.dart';

class MoviesSuggestionsStates {}

class MoviesSuggestionsInitState extends MoviesSuggestionsStates {}

class MoviesSuggestionsLoadingState extends MoviesSuggestionsStates {}

class MoviesSuggestionsErrorState extends MoviesSuggestionsStates {
  Failures error;
  MoviesSuggestionsErrorState({required this.error});
}

class MoviesSuggestionsSuccessState extends MoviesSuggestionsStates {
  final MovieSuggestionsResponseEntity movieSuggestionsResponseEntity ;

  MoviesSuggestionsSuccessState(this.movieSuggestionsResponseEntity);
}