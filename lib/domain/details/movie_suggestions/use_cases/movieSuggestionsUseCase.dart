import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/movieSuggestionsResponseEntity.dart';
import '../repositories/repository/movieSuggestionsRepositories.dart';
@injectable
class MovieSuggestionsUseCase {
  final MovieSuggestionsRepository movieSuggestionsRepository;

  MovieSuggestionsUseCase({required this.movieSuggestionsRepository});

  Future<Either<Failures, MovieSuggestionsResponseEntity>> invoke(int movieID) {
    return movieSuggestionsRepository.getMovieSuggestions(movieID);
  }
}