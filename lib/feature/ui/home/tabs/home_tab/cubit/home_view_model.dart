import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';
import 'package:movie_app/domain/home/usecases/home_use_case.dart';
import 'package:movie_app/feature/ui/home/tabs/home_tab/cubit/home_state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{
  ///handel logic , hold data
  HomeUseCase homeUseCase;
  HomeViewModel({required this.homeUseCase}):super(HomeLoadingState());
   MoviesListEntity moviesList=MoviesListEntity();

  void getMoviesList()async {
    emit(HomeLoadingState());
    var result = await homeUseCase.invoke();
    result.fold((error) => emit(HomeErrorState(failures: error)),
            (moviesListEntity) {
          moviesList = moviesListEntity;
          emit(HomeSuccessState(moviesListEntity: moviesListEntity));
        });
  }
}