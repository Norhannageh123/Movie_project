import 'package:movie_app/domain/details/entities/add_fav_movie_response_entity.dart';

class GetFavMovieResponseEntity {
  GetFavMovieResponseEntity({
      this.message, 
      this.data,});

  String? message;
  List<DataFavMovieResponseEntity>? data;

}
