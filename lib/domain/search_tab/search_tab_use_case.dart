import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/repositories/repo/home_repo.dart';
import 'package:movie_app/domain/search_tab/repository/search_tab_repo.dart';

import '../../../core/errors/failures.dart';
import 'SearchTabEntity.dart';

///Business Logic
@injectable
class SearchTabUseCase{
  ///to make logic must know the data so it should know the repo
  ///it uses abstract repo not concrete
  SearchTabRepository searchTabRepository;
  SearchTabUseCase({required this.searchTabRepository}); ///Constructor injection

///invoke or call or execute
  Future<Either<Failures,SearchTabResponseEntity>>invoke(String movieTitle){
    return searchTabRepository.getSearchMoviesList(movieTitle);
  }
}