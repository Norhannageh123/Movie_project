import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

@injectable
class DetailsUseCase{
  ///business logic
  ///must know the repo
  final DetailsRepo detailsRepo;
  DetailsUseCase({required this.detailsRepo});//constructor injection
  void invokeCachingMovie(){
    detailsRepo.cachingMovie();
  }
  getCachingMovie(){
    return detailsRepo.getCachingMovie();
  }
  Future<Either<Failures, DetailsResponseEntity>> invoke({
  required int movieId,
  bool withImage = true,
  bool withCast = true,
}) {
  return detailsRepo.getMovieDetails(
    movieId: movieId,
    withImage: withImage,
    withCast: withCast,
  );
}

}