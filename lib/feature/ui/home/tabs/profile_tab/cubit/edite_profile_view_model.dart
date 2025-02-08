import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/use_cases/edite_profile_use_case.dart';
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_state.dart';
@injectable
class EditeProfileViewModel extends Cubit<EditProfileState> {
  static EditeProfileResponseEntity editeProfileResponseEntity = EditeProfileResponseEntity();
  EditeProfileUseCase editeProfileUseCase;

  EditeProfileViewModel({required this.editeProfileUseCase})
      : super (EditProfileInitial());

  void updateProfile(String token) async {
    var result = await editeProfileUseCase.invoke(token);
    result.fold(
          (error) {
        emit(EditProfileError(error.errorMessage));
      },
          (response) {
        editeProfileResponseEntity = response;
        emit(EditProfileSuccess(response));
      },
    );
  }
}