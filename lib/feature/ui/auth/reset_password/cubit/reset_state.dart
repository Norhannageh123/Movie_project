import 'package:movie_app/core/errors/failures.dart';

import '../../../../../domain/reset_password/entites/reset_response_entity.dart';

abstract class ResetState {}
class ResetInitState extends ResetState{}
class ResetLoadingState extends ResetState{}
class ResetErrorState extends ResetState{
  Failures error;
  ResetErrorState({required this.error});
}
class ResetSuccessState extends ResetState{
  ResetResponseEntity resetResponseEntity;
  ResetSuccessState({required this.resetResponseEntity});
}