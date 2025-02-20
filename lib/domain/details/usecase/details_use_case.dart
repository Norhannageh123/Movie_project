import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

import '../entities/add_fav_movie_response_entity.dart';
import '../entities/delete_fav_movie_response_entity.dart';

@injectable
class DetailsUseCase{
  ///business logic
  ///must know the repo
  final DetailsRepo detailsRepo;
  DetailsUseCase({required this.detailsRepo});//constructor injection
  void invokeCachingMovie(int id,MovieDetailsEntity movieDetailsEntity){
    detailsRepo.cachingMovie(id,movieDetailsEntity);
  }
  Future<List<MovieDetailsEntity>>invokeGetCachingMovie(){
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
  void deleteMovieFromCaching(int id){
    detailsRepo.deleteMovieFromCaching(id);
  }
  Future<Either<Failures,AddFavMovieResponseEntity>>invokeAddFavMovie(int movieId,
      String name,
      double rating,
      String imgURL,
      String year,
      String token){
    return detailsRepo.addFavMovie(movieId, name, rating, imgURL, year, token);
  }
  Future<Either<Failures,DeleteFavMovieResponseEntity>>deleteFavMovie(int movieId,String token){
    return detailsRepo.deleteFavMovie(movieId,token);
  }
}

