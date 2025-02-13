import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/details/datasources/details_remote_data_source_impl.dart';
import 'package:movie_app/data/details/model/details_response_dm.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/repositories/data_source/details_remote_data_source.dart';
import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

@Injectable(as:DetailsRepo)
class DetailsRepoImpl implements DetailsRepo{
  ///any repo must know the dataSource
  ///so it should have object from remote and local data sources

  //DetailsLocalDataSourceImpl detailsLocalDataSource;
  DetailsRemoteDataSource detailsRemoteDataSource;

  DetailsRepoImpl({
  required this.detailsRemoteDataSource});

  @override
  void cachingMovie() {
    // TODO: implement cachingMovie
  }

  @override
  getCachingMovie() {
    // TODO: implement getCachingMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, DetailsResponseEntity>> getMovieDetails({required int movieId, bool withImage = true, bool withCast = true}) async{
   var result=await detailsRemoteDataSource.getMovieDetails(movieId: movieId);
   return result.fold((fail)=>Left(fail),
          (success)=>Right(success));
  }

}