import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';

import '../../../../../domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';

abstract class DetailsState {}
class DetailsLoadingState extends DetailsState{}
class DetailsErrorState extends DetailsState{
  Failures failures;
  DetailsErrorState({required this.failures});
}
class DetailsSuccessState extends DetailsState{
  DetailsResponseEntity detailsResponseEntity;
  DetailsSuccessState({required this.detailsResponseEntity});
}

class MoviesSuggestionsSuccessState extends DetailsState {
  List <MovieSuggestionsResponseEntity> movieSuggestionsResponseEntity ;
  MoviesSuggestionsSuccessState( {required this.movieSuggestionsResponseEntity});
}