import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';

import '../../../../core/errors/failures.dart';
import '../SearchTabEntity.dart';

abstract class SearchTabRepository  {
  Future<Either<Failures,SearchTabResponseEntity>>getSearchMoviesList(String movieTitle);
}
