import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/repositories/repo/home_repo.dart';

import '../../../core/errors/failures.dart';

///Business Logic
@injectable
class HomeUseCase{
  ///to make logic must know the data so it should know the repo
  ///it uses abstract repo not concrete
  HomeRepo homeRepo;
  HomeUseCase({required this.homeRepo}); ///Constructor injection

///invoke or call or execute
  Future<Either<Failures,MoviesListEntity>>invoke(){
    return homeRepo.getMoviesList();
  }
  Future<Either<Failures,MoviesListEntity>>invokeFilter(String genre){
    return homeRepo.getFilterGenreMoviesList(genre);
  }
}