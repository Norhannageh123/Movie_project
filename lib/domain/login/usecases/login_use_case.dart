import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/entites/login_response_entity.dart';
import 'package:movie_app/domain/login/repositories/repository/login_repository.dart';
@injectable
class LoginUseCase {
  LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});
 Future<Either<Failures,LoginResponseEntity>> invoke(String email,String password){
    return loginRepository.login(email, password);
  }
}