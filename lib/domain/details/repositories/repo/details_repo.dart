
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';

import '../../entities/add_fav_movie_response_entity.dart';

abstract class DetailsRepo{
  void cachingMovie(int id,MovieDetailsEntity movieDetailsEntity);
  ///return Movie Response
  Future<List<MovieDetailsEntity>> getCachingMovie();
  Future<Either<Failures, DetailsResponseEntity>> getMovieDetails({
    required int movieId,
    bool withImage = true,
    bool withCast = true,
  });
  void deleteMovieFromCaching(int id);
  Future<Either<Failures,AddFavMovieResponseEntity>>addFavMovie(int movieId,
      String name,
      double rating,
      String imgURL,
      String year,
      String token);
}

