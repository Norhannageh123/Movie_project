import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../entities/profile_info_response_entity.dart';

abstract class EditeProfileRepository {
  Future<Either<Failures, EditeProfileResponseEntity>> updateProfile(String token);
  Future<Either<Failures, EditeProfileResponseEntity>> deleteProfile(String token);
  Future<Either<Failures, ProfileInfoResponseEntity>> getProfileInfo(String token);

}