import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/entites/login_response_entity.dart';

abstract class LoginState {}
class LoginInitState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  Failures error;
  LoginErrorState({required this.error});
}
class LoginSuccessState extends LoginState{
   LoginResponseEntity loginResponseEntity;
   LoginSuccessState({required this.loginResponseEntity});
}