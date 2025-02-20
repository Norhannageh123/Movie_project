import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';

class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditeProfileResponseEntity successMessage;

  EditProfileSuccess(this.successMessage);
}
class EditProfileCachedSuccess extends EditProfileState {
  final List<MovieDetailsEntity> movieDetailsEntity;

  EditProfileCachedSuccess(this.movieDetailsEntity);
}

class EditProfileHistorySuccess extends EditProfileState {
  final List<MovieDetailsEntity> movieDetailsEntity;

  EditProfileHistorySuccess(this.movieDetailsEntity);
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


