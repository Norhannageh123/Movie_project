import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import '../../../../domain/details/movie_suggestions/repositories/data_source/movieSuggestionsDataSource.dart';
@Injectable(as: MovieSuggestionsDataSource)
class MovieSuggestionsDataSourceImpl implements MovieSuggestionsDataSource{
  @override
  Future<Either<Failures, MovieSuggestionsResponseEntity>> getMovieSuggestions(int movieID) async {
    var either = await ApiManager.instance.request(
        baseUrl: ApiConstants.moviesBaseUrl,
        endpoint: ApiEndpoints.suggestionsEndPoint,
        header: {"movie_id": movieID.toString()},
        method: 'GET');
    return either.fold
      ((error) => Left(error),
            (response) => Right(response));
  }
}
