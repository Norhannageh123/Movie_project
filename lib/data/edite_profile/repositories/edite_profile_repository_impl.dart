import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/edite_profile/data_sources/edite_profile_data_source_impl.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/repositories/repository/edite_profile_repository.dart';

@Injectable(as: EditeProfileRepository)
class EditeProfileRepositoryImpl implements EditeProfileRepository{
  EditeProfileDataSourceImpl editeProfileDataSourceImpl;
  EditeProfileRepositoryImpl({required this.editeProfileDataSourceImpl});
  @override
  Future<Either<Failures, EditeProfileResponseEntity>> updateProfile(String token) {
   return editeProfileDataSourceImpl.updateProfile(token);
  }

}