// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoviesListEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListEntity _$MoviesListEntityFromJson(Map<String, dynamic> json) =>
    MoviesListEntity(
      status: json['status'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : MoviesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesListEntityToJson(MoviesListEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
    };

MoviesData _$MoviesDataFromJson(Map<String, dynamic> json) => MoviesData(
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => MoviesEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesDataToJson(MoviesData instance) =>
    <String, dynamic>{
      'movies': instance.movies,
    };

MoviesEntity _$MoviesEntityFromJson(Map<String, dynamic> json) => MoviesEntity(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      title: json['title'] as String?,
      year: (json['year'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageOriginal: json['background_image_original'] as String?,
      smallCoverImage: json['small_cover_image'] as String?,
      mediumCoverImage: json['medium_cover_image'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$MoviesEntityToJson(MoviesEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'language': instance.language,
      'background_image': instance.backgroundImage,
      'background_image_original': instance.backgroundImageOriginal,
      'small_cover_image': instance.smallCoverImage,
      'medium_cover_image': instance.mediumCoverImage,
      'large_cover_image': instance.largeCoverImage,
      'state': instance.state,
    };
