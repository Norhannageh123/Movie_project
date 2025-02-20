
import 'package:movie_app/domain/details/entities/delete_fav_movie_response_entity.dart';

class DeleteFavMovieResponseDm extends DeleteFavMovieResponseEntity{
  DeleteFavMovieResponseDm({
      super.statusCode,
      super.message,});

  DeleteFavMovieResponseDm.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}