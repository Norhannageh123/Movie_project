import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/entities/get_fav_movie_response_entity.dart';
import 'package:movie_app/domain/edite_profile/entities/edite_profile_response_entity.dart';
import 'package:movie_app/domain/edite_profile/entities/profile_info_response_entity.dart';
import 'package:movie_app/domain/edite_profile/use_cases/edite_profile_use_case.dart';
import 'package:movie_app/feature/ui/auth/login/cubit/token_manager.dart';
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_state.dart';

import '../../../../../../domain/details/entities/add_fav_movie_response_entity.dart';
import '../../../../../../domain/details/usecase/details_use_case.dart';
@injectable
class EditeProfileViewModel extends Cubit<EditProfileState> {
  static EditeProfileResponseEntity editeProfileResponseEntity = EditeProfileResponseEntity();
  EditeProfileUseCase editeProfileUseCase;
  DetailsUseCase detailsUseCase;
  MovieDetailsEntity movieDetailsEntity=MovieDetailsEntity();
  List<MovieDetailsEntity>listCachedMovie=[];
  List<DataFavMovieResponseEntity>listOfFavMovie=[];

  List<MovieDetailsEntity>movieHistoryList=[];
  final TokenManager tokenManager;
  ProfileInfoResponseEntity profileInfoResponseEntity=ProfileInfoResponseEntity();

  EditeProfileViewModel({required this.editeProfileUseCase, required this.tokenManager,required this.detailsUseCase})
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
  void getCachedMovie()async{
    listCachedMovie=await detailsUseCase.invokeGetCachingMovie();
    print("ViewModellllllllllll${listCachedMovie.length}");
    emit(ProfileWishListCachedSuccess(listCachedMovie));
  }
  void getFavMovieDetails(String token) async {
    emit(ProfileGetFavMoviesLoading());
    var result = await detailsUseCase.getFavMovie(token);
    result.fold(
          (error) {
        print("Error occurred: ${error}");
        emit(ProfileGetFavMoviesFailure(error.errorMessage));
      },
          (getFavMovie) {
        print("Get Favorite Movies: ${getFavMovie.length}");
        listOfFavMovie= getFavMovie;

        emit(ProfileGetFavMoviesSuccess(listOfFavMovie));

      },
    );
  }
  void getProfileInfo(String token)async{
    emit(ProfileGetInfoLoading());
    var result = await editeProfileUseCase.getProfileInfo(token);
    result.fold(
          (error) {
        print("Error occurred: ${error}");
      },
          (profileInfo) {
        print("Get Favorite Movies: ${profileInfo.data!.name}");
        profileInfoResponseEntity=profileInfo;

        emit(ProfileGetInfoSuccess(profileInfo));

      },
    );
  }

  void getSavedMovieHistory()async{
    movieHistoryList=await detailsUseCase.invokeGetHistoryMovie();
    emit(EditProfileHistorySuccess(movieHistoryList));
  }
}
