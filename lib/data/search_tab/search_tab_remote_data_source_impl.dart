import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/search_tab/search_tab_response_dm.dart';
import '../../domain/search_tab/SearchTabEntity.dart';
import '../../domain/search_tab/repository/search_tab_remote_data_source.dart';

@Injectable(as:SearchTabRemoteDataSource)
class SearchTabRemoteDataSourceImpl implements SearchTabRemoteDataSource{
  @override
  Future<Either<Failures, SearchTabResponseEntity>> getSearchMoviesList(String movieTitle) async{
    var response=await ApiManager.instance.get(
        baseUrl: ApiConstants.moviesBaseUrl,
        endpoint: ApiEndpoints.availableEndPoint,
       // body: {'query_term' : movieTitle},
        method: "GET",
        header: {"sort_by":"year","order_by":"desc","query_term" : movieTitle}
    );
    return response.fold(
            (l)=>Left(l),
            (r)=>Right(SearchTabResponseDm.fromJson(r)));
  }
}