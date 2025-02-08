import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/register/entites/register_response_entity.dart';
import 'package:movie_app/domain/register/repositories/repository/register_repository.dart';

@injectable
class RegisterUseCase {
  RegisterRepository registerRepository;
  RegisterUseCase({required this.registerRepository});
 Future<Either<Failures,RegisterResponseEntity>> invoke(
  String name,String phoneNumber,
  String email,String password,
  String confirmPassword,int avatarId,
  ){
    return registerRepository.register(name, email, password, confirmPassword, phoneNumber, avatarId);
  }
}