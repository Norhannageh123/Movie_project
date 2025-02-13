import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import '../../../../domain/details/movie_suggestions/repositories/data_source/movieSuggestionsDataSource.dart';
import '../model/movieSuggestionsResponseDm.dart';
@Injectable(as: MovieSuggestionsDataSource)
class MovieSuggestionsDataSourceImpl implements MovieSuggestionsDataSource{
  @override
  Future<Either<Failures, MovieSuggestionsResponseDm>> getMovieSuggestions() async {
    var either = await ApiManager.instance.request(
        baseUrl: ApiConstants.moviesBaseUrl,
        endpoint: ApiEndpoints.suggestionsEndPoint,
        method: 'GET');
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
