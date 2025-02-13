import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';

abstract class DetailsRemoteDataSource {
  Future<Either<Failures, DetailsResponseEntity>> getMovieDetails({
    required int movieId,
    bool withImage = true,
    bool withCast = true,
  });
}
