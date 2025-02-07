import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/home/model/MoviesListResponseDM.dart';
import 'package:movie_app/domain/home/repositories/datasources/home_remote_data_source.dart';

@injectable
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  @override
  Future<Either<Failures,MoviesListResponseDM>>getMoviesList()async{
    var response=await ApiManager.instance.request(
    baseUrl: ApiConstants.moviesBaseUrl,
        endpoint: ApiEndpoints.availableEndPoint,
        method: "GET",
      header: {"sort_by":"year","order_by":"desc"}
    );
    return response.fold(
        (l)=>Left(l),
        (r)=>Right(MoviesListResponseDM.fromJson(r)));

  }
}