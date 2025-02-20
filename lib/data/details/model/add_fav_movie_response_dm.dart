import 'package:movie_app/domain/details/entities/add_fav_movie_response_entity.dart';

class AddFavMovieResponseDm extends AddFavMovieResponseEntity{
  AddFavMovieResponseDm({
      super.message,
      super.data,
  this.statusCode});

  AddFavMovieResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusCode=json['statusCode'];
    data = json['data'] != null ? DataFavMovieResponseDm.fromJson(json['data']) : null;
  }
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] =  (data as DataFavMovieResponseDm?)?.toJson();
    }
    return map;
  }

}

class DataFavMovieResponseDm extends DataFavMovieResponseEntity{
  DataFavMovieResponseDm({
      super.movieId,
      super.name,
      super.rating,
      super.imageURL,
      super.year,});

  DataFavMovieResponseDm.fromJson(dynamic json) {
    movieId = json['movieId'];
    name = json['name'];
    rating = (json['rating'] != null) ? (json['rating'] as num).toDouble() : 0.0;
    imageURL = json['imageURL'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = movieId;
    map['name'] = name;
    map['rating'] = rating;
    map['imageURL'] = imageURL;
    map['year'] = year;
    return map;
  }

}