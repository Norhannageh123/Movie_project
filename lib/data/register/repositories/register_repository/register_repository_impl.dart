import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/data/register/model/register_response_dm.dart';
import 'package:movie_app/domain/register/entites/register_response_entity.dart';
import 'package:movie_app/domain/register/repositories/data_source/remote_data_source/register_remote_data_source.dart';
import 'package:movie_app/domain/register/repositories/repository/register_repository.dart';

@Injectable(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String confirmPassword,
    String phoneNumber,
    int avatarId,
  ) async {
    var either = await registerRemoteDataSource.register( 
        name, email, password, confirmPassword, phoneNumber, avatarId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
