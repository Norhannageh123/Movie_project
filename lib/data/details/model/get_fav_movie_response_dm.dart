import 'package:movie_app/domain/details/entities/get_fav_movie_response_entity.dart';

import 'add_fav_movie_response_dm.dart';

class GetFavMovieResponseDm extends GetFavMovieResponseEntity{
  GetFavMovieResponseDm({
      super.message,
      super.data,});

  GetFavMovieResponseDm.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataFavMovieResponseDm.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => (v as DataFavMovieResponseDm?)?.toJson()).toList();
    }
    return map;
  }


}