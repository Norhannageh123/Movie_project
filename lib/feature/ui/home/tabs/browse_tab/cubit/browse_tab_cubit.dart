import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';
import 'package:movie_app/domain/categories/use_case/categories_use_case.dart';
import 'package:movie_app/feature/ui/home/tabs/browse_tab/cubit/bowse_tab_state.dart';
@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final CategoriesUseCase categoriesUseCase;
  String selectedGenre = '';

  BrowseCubit(this.categoriesUseCase) : super(BrowseInitial());

  Future<void> loadInitialMovies() async {
    emit(BrowseLoading());
    
    var result = await categoriesUseCase.invoke();
    
    result.fold(
      (failure) {
        emit(BrowseError(failure.errorMessage));
      },
      (response) {
        if (response.data?.movies != null && response.data!.movies!.isNotEmpty) {
          final genres = _extractGenres(response.data!.movies!);
          
          if (genres.isNotEmpty) {
            selectedGenre = genres.first;
            loadMoviesByGenre(selectedGenre);
          } else {
            emit(BrowseError("No genres found"));
          }
        } else {
          emit(BrowseError("No movies found"));
        }
      }
    );
  }

  Future<void> loadMoviesByGenre(String genre) async {
    emit(BrowseLoading());
    
    selectedGenre = genre;
    var result = await categoriesUseCase.invoke(genre: genre);
    
    result.fold(
      (failure) {
        emit(BrowseError(failure.errorMessage));
      },
      (response) {
        if (response.data?.movies != null) {
          final genres = _extractGenres(response.data!.movies!);
          emit(BrowseSuccess(
            movies: response.data!.movies!,
            genres: genres,
            totalMovies: response.data?.movieCount ?? 0
          ));
        } else {
          emit(BrowseError("Failed to load movies"));
        }
      }
    );
  }

  Set<String> _extractGenres(List<CategoriesMoviesEntity> movies) {
    Set<String> genres = {};
    for (var movie in movies) {
      if (movie.genres != null) {
        genres.addAll(movie.genres!);
      }
    }
    return genres;
  }

  void changeSelectedGenre(String genre) {
    if (genre != selectedGenre) {
      loadMoviesByGenre(genre);
    }
  }
}