import 'package:movie_app/domain/details/entities/details_response_entity.dart';

abstract class DetailsLocalDataSource{
  void cachingMovie(int id,MovieDetailsEntity movieDetailsEntity);
  ///return Movie Response
  Future<List<MovieDetailsEntity>> getCachingMovie();
  void deleteMovieFromCaching(int id);
}