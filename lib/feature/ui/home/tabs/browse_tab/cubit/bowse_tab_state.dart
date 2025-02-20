
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';

abstract class BrowseState {}

class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseSuccess extends BrowseState {
  final List<CategoriesMoviesEntity> movies;
  final Set<String> genres;
  final int totalMovies;
  
  BrowseSuccess({
    required this.movies,
    required this.genres,
    required this.totalMovies,
  });
}

class BrowseError extends BrowseState {
  final String message;
  
  BrowseError(this.message);
}