import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/entities/add_fav_movie_response_entity.dart';
import 'package:movie_app/domain/details/entities/delete_fav_movie_response_entity.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/repositories/data_source/details_remote_data_source.dart';
import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

import '../../../domain/details/repositories/data_source/details_local_data_source.dart';

@Injectable(as:DetailsRepo)
class DetailsRepoImpl implements DetailsRepo{
  ///any repo must know the dataSource
  ///so it should have object from remote and local data sources

  DetailsLocalDataSource detailsLocalDataSource;
  DetailsRemoteDataSource detailsRemoteDataSource;

  DetailsRepoImpl({
  required this.detailsRemoteDataSource,required this.detailsLocalDataSource});



  @override
  Future<Either<Failures, DetailsResponseEntity>> getMovieDetails({required int movieId, bool withImage = true, bool withCast = true}) async{
   var result=await detailsRemoteDataSource.getMovieDetails(movieId: movieId);
   return result.fold((fail)=>Left(fail),
          (success)=>Right(success));
  }

  @override
  void cachingMovie(int id,MovieDetailsEntity movieDetailsEntity) {
    detailsLocalDataSource.cachingMovie(id, movieDetailsEntity);
  }

  @override
  Future<List<MovieDetailsEntity>> getCachingMovie() {
    return detailsLocalDataSource.getCachingMovie();
  }

  @override
  Future<void> deleteMovieFromCaching(int id) async {
    detailsLocalDataSource.deleteMovieFromCaching(id);
  }

  @override
  Future<Either<Failures, AddFavMovieResponseEntity>> addFavMovie(int movieId, String name,
      double rating, String imgURL, String year, String token) {
    return detailsRemoteDataSource.addFavMovie(movieId, name, rating, imgURL, year, token);
  }

  @override
  Future<Either<Failures, DeleteFavMovieResponseEntity>> deleteFavMovie(int movieId,String token) {
    return detailsRemoteDataSource.deleteFavMovie(movieId,token);
  }

  @override
  Future<Either<Failures, List<DataFavMovieResponseEntity>>> getFavMovie(String token) async{
    var connection=await Connectivity().checkConnectivity();
    if(connection==ConnectivityResult.mobile||
    connection==ConnectivityResult.wifi){
      return detailsRemoteDataSource.getFavMovie(token);
    }else{
      try {
        List<MovieDetailsEntity> cachedMovies = await getCachingMovie();
        List<DataFavMovieResponseEntity> transformedMovies = cachedMovies.map((movie) {
          return DataFavMovieResponseEntity(
            movieId: movie.id.toString(),
            name: movie.title,
            rating: movie.rating,
            imageURL: movie.medium_cover_image,
            year: movie.year.toString(),
          );
        }).toList();

        return Right(transformedMovies);
      } catch (e) {
        return Left(ServerError( errorMessage: ''));
      }
    }

  }

  Future<List<MovieDetailsEntity>> getHistoryMovie() {
    return detailsLocalDataSource.getHistoryMovies();
  }

  @override
  void saveMovie(int id, MovieDetailsEntity movieDetailsEntity) {
    detailsLocalDataSource.historyMovies(id,movieDetailsEntity);
  }



}