import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/usecase/details_use_case.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';

import '../../../../../domain/details/movie_suggestions/entities/movieSuggestionsResponseEntity.dart';
import '../../../../../domain/details/movie_suggestions/use_cases/movieSuggestionsUseCase.dart';
import '../movies_suggestions/cubit/movies_suggestions_state.dart';
@injectable
class DetailsViewModel extends Cubit<DetailsState>{
   DetailsUseCase detailsUseCase;
   MovieSuggestionsUseCase  movieSuggestionsUseCase;
   DetailsViewModel({required this.detailsUseCase, required this.movieSuggestionsUseCase}):super(DetailsInitialState());
   DetailsResponseEntity detailsResponseEntity=DetailsResponseEntity();
   //MovieSuggestionsResponseEntity movieSuggestionsResponseEntity = MovieSuggestionsResponseEntity();
   List<MovieSuggestionsEntity>? moviesSuggestionsList;

   void getMovieDetails(int movieId)async {
     print(detailsResponseEntity.status);
    emit(DetailsLoadingState());
    var result = await detailsUseCase.invoke(movieId: movieId);
    result.fold((error) => emit(DetailsErrorState(failures: error)),
            (detailsResponse) {
          detailsResponseEntity = detailsResponse;

          emit(DetailsSuccessState(detailsResponseEntity: detailsResponse));
        });
  }

   void getSuggestionsMovies(int movieID)async {
     emit(DetailsLoadingState());
     var either = await movieSuggestionsUseCase.invoke(movieID);
     either.fold(
             (error){
           emit(DetailsErrorState(failures: error));
         },
             (response){
           moviesSuggestionsList = response.data?.movies;
           if (moviesSuggestionsList != null){
           emit(MoviesSuggestionsSuccessState( movieSuggestionsResponseEntity: response));}
         }
     );
   }
}
