import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';

abstract class HomeState{}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{
  ///deal always with entity
  ///remember that domain used to concatenation between data layer and presentation layer
  ///so u should use entity not dataModel
  MoviesListEntity moviesListEntity;
  HomeSuccessState({required this.moviesListEntity});

}
class HomeErrorState extends HomeState{
  Failures failures;
  HomeErrorState({required this.failures});
}