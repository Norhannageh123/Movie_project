import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/feature/ui/auth/reset_password/cubit/reset_state.dart';
import '../../../../../domain/reset_password/usecases/reset_use_case.dart';
import '../../login/cubit/token_manager.dart';

@injectable
class ResetViewModel extends Cubit<ResetState>{
  ResetUseCase resetUseCase;
  ResetViewModel({required this.resetUseCase}):super(ResetInitState());
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  final TokenManager tokenManager = GetIt.instance<TokenManager>();
  var formKey = GlobalKey<FormState>();
 void reset() async {
   String? token = tokenManager.getToken();
   if (formKey.currentState?.validate() == true) {
    emit(ResetLoadingState());
    var either = await resetUseCase.invoke(
        newPasswordController.text,
        oldPasswordController.text,
        token!
    );
    print('Token ${tokenManager.getToken()}');
    print('Token2 $token');
    either.fold(
      (error) {
        emit(ResetErrorState(error: error));
      },
      (response) {
        emit(ResetSuccessState(resetResponseEntity: response));
      },
    );
  }
}


}