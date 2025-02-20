import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/search_tab/repository/search_tab_remote_data_source.dart';
import 'package:movie_app/domain/search_tab/repository/search_tab_repo.dart';
import '../../domain/search_tab/SearchTabEntity.dart';



@Injectable(as : SearchTabRepository)
class SearchTabRepoImpl implements SearchTabRepository{
  SearchTabRemoteDataSource searchTabRemoteDataSource;
  SearchTabRepoImpl({required this.searchTabRemoteDataSource});

  @override
  Future<Either<Failures, SearchTabResponseEntity>> getSearchMoviesList(String movieTitle) async{
   var result = await searchTabRemoteDataSource.getSearchMoviesList(movieTitle);
   return result.fold((fail)=>Left(fail),
       (success)=>Right(success));
  }
}