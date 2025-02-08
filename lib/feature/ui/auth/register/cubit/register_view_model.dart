import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/register/usecases/register_use_case.dart';
import 'package:movie_app/feature/ui/auth/register/cubit/register_state.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitState());

  final TextEditingController userNameController = TextEditingController(text:"Hanaa Hany");
  final TextEditingController emailController = TextEditingController(text:"hanaa3@gmail.com");
  final TextEditingController phoneNumberController = TextEditingController(text:"+201007896325");
  final TextEditingController passwordController = TextEditingController(text:"Hh123456@");
  final TextEditingController rePasswordController = TextEditingController(text:"Hh123456@");
  var formKey = GlobalKey<FormState>();

  int avatarId = 0; 

  void setAvatarId(int id) {
    avatarId = id;
    emit(RegisterInitState()); 
  }

  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState());

      var either = await registerUseCase.invoke(
        userNameController.text,
        phoneNumberController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        avatarId, 
      );

      either.fold(
        (error) {
          emit(RegisterErrorState(error: error));
        },
        (response) {
          emit(RegisterSuccessState(registerResponseEntity: response));
        },
      );
    }
  }
}
