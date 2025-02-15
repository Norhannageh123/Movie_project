import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';

abstract class MovieSuggestionsRepository {
  Future<Either<Failures, MovieSuggestionsResponseEntity>> getMovieSuggestions(int movieID);
}