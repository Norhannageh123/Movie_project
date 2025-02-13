import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';

part 'details_response_dm.g.dart';

@JsonSerializable()
class DetailsResponseDm extends DetailsResponseEntity {
  DetailsResponseDm({
    super.status,
    super.statusMessage,
    super.data,
    super.meta,
  });

  factory DetailsResponseDm.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseDmFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsResponseDmToJson(this);
}

@JsonSerializable()
class MetaDetailsDM extends MetaDetailsEntity {
  MetaDetailsDM({
    super.serverTime,
    super.serverTimezone,
    super.apiVersion,
    super.executionTime,
  });

  factory MetaDetailsDM.fromJson(Map<String, dynamic> json) =>
      _$MetaDetailsDMFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDetailsDMToJson(this);
}

@JsonSerializable()
class DataDetailsDM extends DataDetailsEntity {
  DataDetailsDM({super.movie});

  factory DataDetailsDM.fromJson(Map<String, dynamic> json) =>
      _$DataDetailsDMFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailsDMToJson(this);
}

@JsonSerializable()
class MovieDetailsDM extends MovieDetailsEntity {
  MovieDetailsDM({
    super.id,
    super.url,
    super.imdbCode,
    super.title,
    super.titleEnglish,
    super.titleLong,
    super.slug,
    super.year,
    super.rating,
    super.runtime,
    super.genres,
    super.likeCount,
    super.descriptionIntro,
    super.descriptionFull,
    super.ytTrailerCode,
    super.language,
    super.mpaRating,
    super.backgroundImage,
    super.backgroundImageOriginal,
    super.smallCoverImage,
    super.mediumCoverImage,
    super.largeCoverImage,
    super.mediumScreenshotImage1,
    super.mediumScreenshotImage2,
    super.mediumScreenshotImage3,
    super.largeScreenshotImage1,
    super.largeScreenshotImage2,
    super.largeScreenshotImage3,
    super.cast,
    super.torrents,
    super.dateUploaded,
    super.dateUploadedUnix,
  });

  factory MovieDetailsDM.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDMFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsDMToJson(this);
}

@JsonSerializable()
class TorrentsDetailsDM extends TorrentsDetailsEntity {
  TorrentsDetailsDM({
    super.url,
    super.hash,
    super.quality,
    super.type,
    super.isRepack,
    super.videoCodec,
    super.bitDepth,
    super.audioChannels,
    super.seeds,
    super.peers,
    super.size,
    super.sizeBytes,
    super.dateUploaded,
    super.dateUploadedUnix,
  });

  factory TorrentsDetailsDM.fromJson(Map<String, dynamic> json) =>
      _$TorrentsDetailsDMFromJson(json);

  Map<String, dynamic> toJson() => _$TorrentsDetailsDMToJson(this);
}

@JsonSerializable()
class CastDetailsDM extends CastDetailsEntity {
  CastDetailsDM({
    super.name,
    super.characterName,
    super.urlSmallImage,
    super.imdbCode,
  });

  factory CastDetailsDM.fromJson(Map<String, dynamic> json) =>
      _$CastDetailsDMFromJson(json);

  Map<String, dynamic> toJson() => _$CastDetailsDMToJson(this);
}
