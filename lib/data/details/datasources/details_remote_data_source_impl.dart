import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/details/model/add_fav_movie_response_dm.dart';
import 'package:movie_app/data/details/model/details_response_dm.dart';
import 'package:movie_app/domain/details/entities/add_fav_movie_response_entity.dart';
import '../../../domain/details/repositories/data_source/details_remote_data_source.dart';

@Injectable(as:DetailsRemoteDataSource)
class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource {
  @override
  Future<Either<Failures, DetailsResponseDm>> getMovieDetails({
    required int movieId,
    bool withImage = true,
    bool withCast = true,
  }) async {
    var response = await ApiManager.instance.request(
      baseUrl: ApiConstants.moviesBaseUrl,
      endpoint: ApiEndpoints.detailsEndPoint,
      method: "GET",
      header: {
        "movie_id": movieId.toString(), 
        "with_images": withImage.toString(), 
        "with_cast": withCast.toString(),
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) => Right(DetailsResponseDm.fromJson(r)),
    );
  }

  @override
  Future<Either<Failures, AddFavMovieResponseEntity>> addFavMovie(int movieId, String name,
      double rating, String imgURL, String year, String token)async {
    var response=await ApiManager.instance.request(baseUrl: ApiConstants.baseUrl,
        endpoint: ApiEndpoints.addFavEndPoint,
        method: "POST",
    body: {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imgURL,
      "year": year
    },
    token: token);
    return response.fold((error)=>left(error), (successResponse)=>Right(AddFavMovieResponseDm.fromJson(successResponse)));
  }

}
