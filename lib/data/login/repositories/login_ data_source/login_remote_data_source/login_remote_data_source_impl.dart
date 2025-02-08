import 'package:dartz/dartz.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/login/model/login_response_dm.dart';
import 'package:movie_app/domain/login/repositories/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:LoginRemoteDataSource )
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Either<Failures, LoginResponseDm>> login(String email, String password) async {
    var result = await ApiManager.instance.request(
      baseUrl: ApiConstants.baseUrl,
      endpoint: ApiEndpoints.loginEndPoint,
      method: 'POST',
      body: {'email': email, 'password': password},
    );

    return result.fold(
      (failure) => Left(failure),
      (json) => Right(LoginResponseDm.fromJson(json)),
    );
  }
}
