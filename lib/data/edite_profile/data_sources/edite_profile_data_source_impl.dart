import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/repositories/data_source/edite_profile_data_source.dart';
@Injectable(as: EditeProfileDataSource)
class EditeProfileDataSourceImpl implements EditeProfileDataSource{
  @override
  Future<Either<Failures, EditeProfileResponseEntity>> updateProfile(String token) async {
    var result = await ApiManager.instance.request(
        baseUrl: ApiConstants.baseUrl,
        endpoint: ApiEndpoints.updateProfileEndPoint,
        token: token,
        body: {
      "name": "Updated Name", 
      "phone": "+201111111111"
    },
        method: 'PATCH');
    return result.fold((failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failures, EditeProfileResponseEntity>> deleteProfile(String token) async {
    var result = await ApiManager.instance.request(
        baseUrl: ApiConstants.baseUrl,
        endpoint: ApiEndpoints.updateProfileEndPoint,
        token: token,
        method: 'DELETE');
    return result.fold((failure) => Left(failure), (response) => Right(response));
  }
}
