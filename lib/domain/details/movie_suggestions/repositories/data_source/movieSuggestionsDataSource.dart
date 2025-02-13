import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import '../../entities/movieSuggestionsResponseEntity.dart';

abstract class MovieSuggestionsDataSource {
  Future<Either<Failures, MovieSuggestionsResponseEntity>> getMovieSuggestions();

}