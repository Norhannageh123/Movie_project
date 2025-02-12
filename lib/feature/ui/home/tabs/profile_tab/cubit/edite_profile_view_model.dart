import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/use_cases/edite_profile_use_case.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/token_manager.dart';
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_state.dart';
@injectable
class EditeProfileViewModel extends Cubit<EditProfileState> {
  static EditeProfileResponseEntity editeProfileResponseEntity = EditeProfileResponseEntity();
  EditeProfileUseCase editeProfileUseCase;
  final TokenManager tokenManager;

  EditeProfileViewModel({required this.editeProfileUseCase, required this.tokenManager})
      : super(EditProfileInitial());

  
  Future<String?> getToken() async {
    return await tokenManager.getToken();
  }

  void updateProfile() async {
    String? token = await getToken();
    if (token != null) {
      emit(EditProfileLoading());
      var result = await editeProfileUseCase.updateProfile(token);
      result.fold(
        (error) {
          emit(EditProfileError(error.errorMessage));
        },
        (response) {
          editeProfileResponseEntity = response;
          emit(EditProfileSuccess(response));
        },
      );
    } else {
      emit(EditProfileError("Token is not available"));
    }
  }

  void deleteAccount() async {
    String? token = await getToken();
    if (token != null) {
      emit(DeleteAccountLoading());
      var result = await editeProfileUseCase.deleteProfile(token);
      result.fold(
        (error) {
          emit(DeleteAccountError(error.errorMessage));
        },
        (response) {
          emit(DeleteAccountSuccess("Account deleted successfully"));
        },
      );
    } else {
      emit(DeleteAccountError("Token is not available"));
    }
  }
}
