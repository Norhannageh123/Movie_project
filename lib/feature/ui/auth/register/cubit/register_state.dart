import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/register/entites/register_response_entity.dart';

abstract class RegisterState {}
class RegisterInitState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  Failures error;
  RegisterErrorState({required this.error});
}
class RegisterSuccessState extends RegisterState{
   RegisterResponseEntity registerResponseEntity;
   RegisterSuccessState({required this.registerResponseEntity});
}