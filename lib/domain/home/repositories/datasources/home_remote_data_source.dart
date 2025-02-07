import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';


abstract class HomeRemoteDataSource{

  Future<Either<Failures,MoviesListEntity>>getMoviesList();

}