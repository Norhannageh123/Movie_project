import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/repositories/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/reset_password/entites/reset_response_entity.dart';
import '../../../domain/reset_password/repositories/data_source/reset_remote_data_source.dart';
import '../../../domain/reset_password/repositories/repository/reset_repository.dart';
@Injectable(as: ResetRepository)
class ResetRepositoryImpl implements ResetRepository{
  ResetRemoteDataSource resetRemoteDataSource;
  ResetRepositoryImpl({required this.resetRemoteDataSource});
  @override
  Future<Either<Failures, ResetResponseEntity>> reset(String oldPassword,String newPassword,String token) async{
    
    var either=await resetRemoteDataSource.reset(oldPassword, newPassword,token) ;
   return  either.fold((error)=>(Left(error)), (response)=>(Right(response)));
  }

}