import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/repositories/repository/edite_profile_repository.dart';
import '../../../core/errors/failures.dart';
@injectable
class EditeProfileUseCase {
  final EditeProfileRepository editeProfileRepository;

  EditeProfileUseCase({required this.editeProfileRepository});

  Future<Either<Failures, EditeProfileResponseEntity>> updateProfile(String token) {
    return editeProfileRepository.updateProfile(token);
  }

  Future<Either<Failures, EditeProfileResponseEntity>> deleteProfile(String token) {
    return editeProfileRepository.deleteProfile(token);
  }
}