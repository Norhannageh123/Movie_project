import 'package:json_annotation/json_annotation.dart';

part 'MoviesListEntity.g.dart';

@JsonSerializable()
class MoviesListEntity {
  MoviesListEntity({
    this.status,
    this.statusMessage,
    this.data,
  });

  String? status;
  String? statusMessage;
  MoviesData? data; // Renamed to avoid conflict

  factory MoviesListEntity.fromJson(Map<String, dynamic> json) =>
      _$MoviesListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesListEntityToJson(this);
}

@JsonSerializable()
class MoviesData {
  MoviesData({
    this.movies,
  });

  List<MoviesEntity>? movies;

  factory MoviesData.fromJson(Map<String, dynamic> json) =>
      _$MoviesDataFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDataToJson(this);
}

@JsonSerializable()
class MoviesEntity {
  MoviesEntity({
    this.url,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.language,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
  });

  String? url;
  String? title;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? language;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;

  @JsonKey(name: 'background_image_original')
  final String? backgroundImageOriginal;

  @JsonKey(name: 'small_cover_image')
  final String? smallCoverImage;

  @JsonKey(name: 'medium_cover_image')
  final String? mediumCoverImage;

  @JsonKey(name: 'large_cover_image')
  final String? largeCoverImage;

  String? state;

  factory MoviesEntity.fromJson(Map<String, dynamic> json) =>
      _$MoviesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesEntityToJson(this);
}
