import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import '../entites/reset_response_entity.dart';
import '../repositories/repository/reset_repository.dart';
@injectable
class ResetUseCase {
  ResetRepository resetRepository;
  ResetUseCase({required this.resetRepository});
 Future<Either<Failures,ResetResponseEntity>> invoke(String oldPassword, String newPassword,String token){
    return resetRepository.reset(oldPassword, newPassword,token);
  }
}