import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/home/entities/MoviesListEntity.dart';

import '../../../../../../domain/search_tab/SearchTabEntity.dart';

abstract class SearchTabState{}
class SearchTabInitialState extends SearchTabState{}
class SearchTabLoadingState extends SearchTabState{}
class SearchTabSuccessState extends SearchTabState{
  ///deal always with entity
  ///remember that domain used to concatenation between data layer and presentation layer
  ///so u should use entity not dataModel
  SearchTabResponseEntity searchTabResponseEntity;
  SearchTabSuccessState({required this.searchTabResponseEntity});

}
class SearchTabErrorState extends SearchTabState{
  Failures failures;
  SearchTabErrorState({required this.failures});
}