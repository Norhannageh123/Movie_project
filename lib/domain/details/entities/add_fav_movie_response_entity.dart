class AddFavMovieResponseEntity {
  AddFavMovieResponseEntity({
      this.message, 
      this.data,});
  String? message;
  DataFavMovieResponseEntity? data;

}
class DataFavMovieResponseEntity {
  DataFavMovieResponseEntity({
      this.movieId, 
      this.name, 
      this.rating, 
      this.imageURL, 
      this.year,});
  String? movieId;
  String? name;
  double? rating;
  String? imageURL;
  String? year;


}