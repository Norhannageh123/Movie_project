import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/home/datasources/home_remote_data_source_impl.dart';
import 'package:movie_app/data/home/model/MoviesListResponseDM.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/repositories/repo/home_repo.dart';



@Injectable(as : HomeRepo)
class HomeRepoImpl implements HomeRepo{
  HomeRemoteDataSourceImpl homeRemoteDataSourceImpl;
  HomeRepoImpl({required this.homeRemoteDataSourceImpl});
  @override
  Future<Either<Failures,MoviesListResponseDM>>getMoviesList()async{
      var result=await homeRemoteDataSourceImpl.getMoviesList();
      return result.fold((fail)=>Left(fail),
          (success)=>Right(success));
  }

  @override
  Future<Either<Failures, MoviesListEntity>> getFilterGenreMoviesList(String genre) async{
    var result=await homeRemoteDataSourceImpl.getFilterGenreMoviesList(genre);
    return result.fold((fail)=>Left(fail),
            (success)=>Right(success));
  }
}