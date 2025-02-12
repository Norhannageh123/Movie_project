import 'package:dartz/dartz.dart';
import 'package:movie_app/core/api/api_constants.dart';
import 'package:movie_app/core/api/api_endpoints.dart';
import 'package:movie_app/core/api/api_manager.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/reset_password/repositories/data_source/reset_remote_data_source.dart';
import '../model/reset_responseDm.dart';


@Injectable(as: ResetRemoteDataSource)
class ResetRemoteDataSourceImpl implements ResetRemoteDataSource {
  @override
  Future<Either<Failures, ResetResponseDm>> reset(String oldPassword,String newPassword , String token) async {
    // Retrieve the token
    var result = await ApiManager.instance.request(
      baseUrl: ApiConstants.baseUrl,
      endpoint: ApiEndpoints.resetEndPoint,
      token: token,
      method: 'PATCH',
      body: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      },
    );
    return result.fold(
          (l) => Left(l),
          (r) => Right(ResetResponseDm.fromJson(r)),
    );
  }

}
