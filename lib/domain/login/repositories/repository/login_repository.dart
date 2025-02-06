import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/entites/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Failures,LoginResponseEntity>> login(
    String email,
    String password,
  );
}