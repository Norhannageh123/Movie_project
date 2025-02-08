
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/login/usecases/login_use_case.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/login_state.dart';
@injectable
class LoginViewModel extends Cubit<LoginState>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(LoginInitState());
  var emailController = TextEditingController(text:"norhan@gmail.com");
var passwordController = TextEditingController(text: "Nn123456");

  var formKey = GlobalKey<FormState>();

 void login() async {
  if (formKey.currentState!.validate() == true) {
    emit(LoginLoadingState()); 
    
    var either = await loginUseCase.invoke(emailController.text, passwordController.text);
    
    either.fold(
      (error) {
        emit(LoginErrorState(error: error));  
      },
      (response) {
        emit(LoginSuccessState(loginResponseEntity: response));  
      },
    );
  }
}


}