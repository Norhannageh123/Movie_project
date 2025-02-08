import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/register/entites/register_response_entity.dart';

abstract class RegisterRepository {
   Future<Either<Failures,RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phoneNumber,
    int avatarId,
  );
}