import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/entites/login_response_entity.dart';
import 'package:movie_app/domain/login/repositories/data_source/remote_data_source/login_remote_data_source.dart';
import 'package:movie_app/domain/login/repositories/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:LoginRepository)
class LoginRepositoryImpl implements LoginRepository{
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl({required this.loginRemoteDataSource});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password) async{
    
    var either=await loginRemoteDataSource.login(email, password) ;
   return  either.fold((error)=>(Left(error)), (response)=>(Right(response)));
  }

}