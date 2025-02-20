import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';

import '../SearchTabEntity.dart';


abstract class SearchTabRemoteDataSource{

  Future<Either<Failures,SearchTabResponseEntity>>getSearchMoviesList(String movieTitle);

}