import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditeProfileResponseEntity successMessage;

  EditProfileSuccess(this.successMessage);
}

class EditProfileError extends EditProfileState {
  final String errorMessage;

  EditProfileError(this.errorMessage);
}

class DeleteAccountLoading extends EditProfileState {}

class DeleteAccountSuccess extends EditProfileState {
  final String successMessage;

  DeleteAccountSuccess(this.successMessage);
}

class DeleteAccountError extends EditProfileState {
  final String errorMessage;

  DeleteAccountError(this.errorMessage);
}