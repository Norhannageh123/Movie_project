import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'details_response_entity.g.dart';

@JsonSerializable()
class DetailsResponseEntity {
  DetailsResponseEntity({
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  String? status;
  String? statusMessage;
  DataDetailsEntity? data;
  MetaDetailsEntity? meta;

  factory DetailsResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsResponseEntityToJson(this);
}

@JsonSerializable()
class DataDetailsEntity {
  DataDetailsEntity({this.movie});

  MovieDetailsEntity? movie;

  factory DataDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$DataDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailsEntityToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 1)
class MovieDetailsEntity extends HiveObject {
  MovieDetailsEntity({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.like_count,
    this.description_intro,
    this.description_full,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.background_image,
    this.background_image_original,
    this.small_cover_image,
    this.medium_cover_image,
    this.large_cover_image,
    this.medium_screenshot_image1,
    this.medium_screenshot_image2,
    this.medium_screenshot_image3,
    this.large_screenshot_image1,
    this.large_screenshot_image2,
    this.large_screenshot_image3,
    this.cast,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });
  @HiveField(1)
  int? id;
  String? url;
  String? imdbCode;
  @HiveField(2)
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  @HiveField(3)
  int? year;
  @HiveField(4)
  double? rating;
  @HiveField(10)
  int? runtime;
  List<String>? genres;
  @HiveField(6)
  int? like_count;
  String? description_intro;
  @HiveField(7)
  String? description_full;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? background_image;
  String? background_image_original;
  String? small_cover_image;
  @HiveField(8)
  String? medium_cover_image;
  String? large_cover_image;
  String? medium_screenshot_image1;
  String? medium_screenshot_image2;
  String? medium_screenshot_image3;
  String? large_screenshot_image1;
  String? large_screenshot_image2;
  String? large_screenshot_image3;
  List<CastDetailsEntity>? cast;
  List<TorrentsDetailsEntity>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  factory MovieDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsEntityToJson(this);
}

@JsonSerializable()
class MetaDetailsEntity {
  MetaDetailsEntity({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  factory MetaDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$MetaDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDetailsEntityToJson(this);
}

@JsonSerializable()
class TorrentsDetailsEntity {
  TorrentsDetailsEntity({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  factory TorrentsDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$TorrentsDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentsDetailsEntityToJson(this);
}

@JsonSerializable()
class CastDetailsEntity {
  CastDetailsEntity({
    this.name,
    this.character_name,
    this.urlSmallImage,
    this.imdb_code,
  });

  String? name;
  String? character_name;
  String? urlSmallImage;
  String? imdb_code;

  factory CastDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$CastDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CastDetailsEntityToJson(this);
}
