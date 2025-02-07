import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/repositories/datasources/home_remote_data_source.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo  {
  Future<Either<Failures,MoviesListEntity>>getMoviesList();
}
