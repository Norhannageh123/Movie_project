import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import '../../entites/reset_response_entity.dart';

abstract class ResetRepository {
  Future<Either<Failures,ResetResponseEntity>> reset(
    String oldPassword,
    String newPassword,
    String token,
  );

}