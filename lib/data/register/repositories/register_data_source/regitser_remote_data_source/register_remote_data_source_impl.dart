 import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/register/model/register_response_dm.dart';
import 'package:movie_app/domain/register/repositories/data_source/remote_data_source/register_remote_data_source.dart';

import '../../../../../core/api/api_constants.dart';

@Injectable(as: RegisterRemoteDataSource)
class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  @override
  Future<Either<Failures, RegisterResponseDm>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phoneNumber,
    int avatarId,
  ) async {
    var result = await ApiManager.instance.request(
      endpoint: ApiEndpoints.registerEndPoint,
      method: 'POST',
      body: {
        'email': email,
        'password': password,
        'name': name,
        'confirmPassword': confirmPassword,
        'phone': phoneNumber,
        'avaterId': avatarId
      }, baseUrl: ApiConstants.baseUrl,
    );

    return result.fold(
      (failure) => Left(failure),
      (json) => Right(RegisterResponseDm.fromJson(json)),
    );
  }
}