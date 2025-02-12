import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';

abstract class EditeProfileDataSource {
  Future<Either<Failures, EditeProfileResponseEntity>> updateProfile(String token);
  Future<Either<Failures, EditeProfileResponseEntity>> deleteProfile(String token);
}