import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/usecase/details_use_case.dart';
import 'package:movie_app/feature/ui/home/details_screen/cubit/details_state.dart';

class DetailsViewModel extends Cubit<DetailsState>{
   DetailsUseCase detailsUseCase;
   DetailsViewModel({required this.detailsUseCase}):super(DetailsLoadingState());
   DetailsResponseEntity detailsResponseEntity=DetailsResponseEntity();

   void getMovieDetails(int movieId)async {
    emit(DetailsLoadingState());
    var result = await detailsUseCase.invoke(movieId: movieId);
    result.fold((error) => emit(DetailsErrorState(failures: error)),
            (detailsResponse) {
          detailsResponseEntity = detailsResponse;
          emit(DetailsSuccessState(detailsResponseEntity: detailsResponse));
        });
  }
}