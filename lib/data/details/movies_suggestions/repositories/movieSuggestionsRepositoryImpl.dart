import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import '../../../../domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import '../../../../domain/details/movie_suggestions/repositories/data_source/movieSuggestionsDataSource.dart';
import '../../../../domain/details/movie_suggestions/repositories/repository/movieSuggestionsRepositories.dart';
@Injectable(as: MovieSuggestionsRepository)
class MovieSuggestionsRepositoryImpl implements MovieSuggestionsRepository{
  final MovieSuggestionsDataSource movieSuggestionsDataSourceImpl;
  MovieSuggestionsRepositoryImpl({required this.movieSuggestionsDataSourceImpl});

  @override
  Future<Either<Failures, List<MovieSuggestionsResponseEntity>>> getMovieSuggestions(movieID) async{
    var either = await movieSuggestionsDataSourceImpl.
    getMovieSuggestions(movieID);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}