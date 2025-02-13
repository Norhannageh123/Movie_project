
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/domain/login/entites/login_response_entity.dart';
import 'package:movie_app/domain/login/usecases/login_use_case.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/login_state.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/token_manager.dart';
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_view_model.dart';
@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginResponseEntity? loginResponseEntity;

  final LoginUseCase loginUseCase;
  final EditeProfileViewModel editeProfileViewModel;

  LoginViewModel({
    required this.loginUseCase,
    required this.editeProfileViewModel,
  }) : super(LoginInitState());

  var emailController = TextEditingController(text: "norhan3@gmail.com");
  var passwordController = TextEditingController(text: "Nn123456@");
  // Retrieve TokenManager using GetIt
  final TokenManager tokenManager = GetIt.instance<TokenManager>();
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());

      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);

      either.fold(
        (error) {
          emit(LoginErrorState(error: error));
        },
        (loginResponse) async {
          if (loginResponse.data != null) {
            print('Token in login cubit: ${loginResponse.data}');
            await tokenManager.saveToken(loginResponse.data!);
            emit(LoginSuccessState(loginResponseEntity: loginResponse, token: loginResponse.data));
          } else {
            emit(LoginErrorState(error: ServerError(errorMessage: 'Token is null')));
          }
        },
      );
    }
  }
}
