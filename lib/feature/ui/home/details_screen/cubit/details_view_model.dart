import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/usecase/details_use_case.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/toggle_icon.dart';
@injectable
class DetailsViewModel extends Cubit<DetailsState>{
   DetailsUseCase detailsUseCase;
   DetailsViewModel({required this.detailsUseCase}):super(DetailsLoadingState());
   DetailsResponseEntity detailsResponseEntity=DetailsResponseEntity();
    ToggleIcon toggleSavedIcon = GetIt.instance<ToggleIcon>();
   // int toggleSavedIcon=0;

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
  void savedMovie(int movieId,MovieDetailsEntity movie)async{
   detailsUseCase.invokeCachingMovie(movieId,movie);
   toggleSavedIcon.saveToggleIcon(1);
   emit(DetailsSuccessState(detailsResponseEntity: detailsResponseEntity));
  }

  void deleteMovie(int movieId)async{
     toggleSavedIcon.saveToggleIcon(0);
     detailsUseCase.deleteMovieFromCaching(movieId);
     emit(DetailsSuccessState(detailsResponseEntity: detailsResponseEntity));

   }

  void saveHistoryMovie(int movieId,MovieDetailsEntity movie)async{
     detailsUseCase.invokeHistoryMovie(movieId,movie);
     emit(DetailsSuccessState(detailsResponseEntity: detailsResponseEntity));
   }
}