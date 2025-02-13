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
class MovieDetailsEntity {
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
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
    this.cast,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;
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
    this.characterName,
    this.urlSmallImage,
    this.imdbCode,
  });

  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;

  factory CastDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$CastDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CastDetailsEntityToJson(this);
}
