import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/add_fav_movie_response_entity.dart';
import 'package:movie_app/domain/details/entities/delete_fav_movie_response_entity.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/entities/get_fav_movie_response_entity.dart';

abstract class DetailsRemoteDataSource {
  Future<Either<Failures, DetailsResponseEntity>> getMovieDetails({
    required int movieId,
    bool withImage = true,
    bool withCast = true,
  });
  Future<Either<Failures,AddFavMovieResponseEntity>>addFavMovie(int movieId,
      String name,
      double rating,
      String imgURL,
      String year,
      String token);
  Future<Either<Failures,DeleteFavMovieResponseEntity>>deleteFavMovie(int movieId,String token);
  Future<Either<Failures,List<DataFavMovieResponseEntity>>>getFavMovie(String token);
}
