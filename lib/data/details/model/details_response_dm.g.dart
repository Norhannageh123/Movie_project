// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsResponseDm _$DetailsResponseDmFromJson(Map<String, dynamic> json) =>
    DetailsResponseDm(
      status: json['status'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : DataDetailsEntity.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaDetailsEntity.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsResponseDmToJson(DetailsResponseDm instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
      'meta': instance.meta,
    };

MetaDetailsDM _$MetaDetailsDMFromJson(Map<String, dynamic> json) =>
    MetaDetailsDM(
      serverTime: (json['serverTime'] as num?)?.toInt(),
      serverTimezone: json['serverTimezone'] as String?,
      apiVersion: (json['apiVersion'] as num?)?.toInt(),
      executionTime: json['executionTime'] as String?,
    );

Map<String, dynamic> _$MetaDetailsDMToJson(MetaDetailsDM instance) =>
    <String, dynamic>{
      'serverTime': instance.serverTime,
      'serverTimezone': instance.serverTimezone,
      'apiVersion': instance.apiVersion,
      'executionTime': instance.executionTime,
    };

DataDetailsDM _$DataDetailsDMFromJson(Map<String, dynamic> json) =>
    DataDetailsDM(
      movie: json['movie'] == null
          ? null
          : MovieDetailsEntity.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDetailsDMToJson(DataDetailsDM instance) =>
    <String, dynamic>{
      'movie': instance.movie,
    };

MovieDetailsDM _$MovieDetailsDMFromJson(Map<String, dynamic> json) =>
    MovieDetailsDM(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      imdbCode: json['imdbCode'] as String?,
      title: json['title'] as String?,
      titleEnglish: json['titleEnglish'] as String?,
      titleLong: json['titleLong'] as String?,
      slug: json['slug'] as String?,
      year: (json['year'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      likeCount: (json['likeCount'] as num?)?.toInt(),
      descriptionIntro: json['descriptionIntro'] as String?,
      descriptionFull: json['descriptionFull'] as String?,
      ytTrailerCode: json['ytTrailerCode'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpaRating'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      backgroundImageOriginal: json['backgroundImageOriginal'] as String?,
      smallCoverImage: json['smallCoverImage'] as String?,
      mediumCoverImage: json['mediumCoverImage'] as String?,
      largeCoverImage: json['largeCoverImage'] as String?,
      mediumScreenshotImage1: json['mediumScreenshotImage1'] as String?,
      mediumScreenshotImage2: json['mediumScreenshotImage2'] as String?,
      mediumScreenshotImage3: json['mediumScreenshotImage3'] as String?,
      largeScreenshotImage1: json['largeScreenshotImage1'] as String?,
      largeScreenshotImage2: json['largeScreenshotImage2'] as String?,
      largeScreenshotImage3: json['largeScreenshotImage3'] as String?,
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastDetailsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      torrents: (json['torrents'] as List<dynamic>?)
          ?.map(
              (e) => TorrentsDetailsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateUploaded: json['dateUploaded'] as String?,
      dateUploadedUnix: (json['dateUploadedUnix'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailsDMToJson(MovieDetailsDM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'imdbCode': instance.imdbCode,
      'title': instance.title,
      'titleEnglish': instance.titleEnglish,
      'titleLong': instance.titleLong,
      'slug': instance.slug,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'genres': instance.genres,
      'likeCount': instance.likeCount,
      'descriptionIntro': instance.descriptionIntro,
      'descriptionFull': instance.descriptionFull,
      'ytTrailerCode': instance.ytTrailerCode,
      'language': instance.language,
      'mpaRating': instance.mpaRating,
      'backgroundImage': instance.backgroundImage,
      'backgroundImageOriginal': instance.backgroundImageOriginal,
      'smallCoverImage': instance.smallCoverImage,
      'mediumCoverImage': instance.mediumCoverImage,
      'largeCoverImage': instance.largeCoverImage,
      'mediumScreenshotImage1': instance.mediumScreenshotImage1,
      'mediumScreenshotImage2': instance.mediumScreenshotImage2,
      'mediumScreenshotImage3': instance.mediumScreenshotImage3,
      'largeScreenshotImage1': instance.largeScreenshotImage1,
      'largeScreenshotImage2': instance.largeScreenshotImage2,
      'largeScreenshotImage3': instance.largeScreenshotImage3,
      'cast': instance.cast,
      'torrents': instance.torrents,
      'dateUploaded': instance.dateUploaded,
      'dateUploadedUnix': instance.dateUploadedUnix,
    };

TorrentsDetailsDM _$TorrentsDetailsDMFromJson(Map<String, dynamic> json) =>
    TorrentsDetailsDM(
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      quality: json['quality'] as String?,
      type: json['type'] as String?,
      isRepack: json['isRepack'] as String?,
      videoCodec: json['videoCodec'] as String?,
      bitDepth: json['bitDepth'] as String?,
      audioChannels: json['audioChannels'] as String?,
      seeds: (json['seeds'] as num?)?.toInt(),
      peers: (json['peers'] as num?)?.toInt(),
      size: json['size'] as String?,
      sizeBytes: (json['sizeBytes'] as num?)?.toInt(),
      dateUploaded: json['dateUploaded'] as String?,
      dateUploadedUnix: (json['dateUploadedUnix'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TorrentsDetailsDMToJson(TorrentsDetailsDM instance) =>
    <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'type': instance.type,
      'isRepack': instance.isRepack,
      'videoCodec': instance.videoCodec,
      'bitDepth': instance.bitDepth,
      'audioChannels': instance.audioChannels,
      'seeds': instance.seeds,
      'peers': instance.peers,
      'size': instance.size,
      'sizeBytes': instance.sizeBytes,
      'dateUploaded': instance.dateUploaded,
      'dateUploadedUnix': instance.dateUploadedUnix,
    };

CastDetailsDM _$CastDetailsDMFromJson(Map<String, dynamic> json) =>
    CastDetailsDM(
      name: json['name'] as String?,
      characterName: json['characterName'] as String?,
      urlSmallImage: json['urlSmallImage'] as String?,
      imdbCode: json['imdbCode'] as String?,
    );

Map<String, dynamic> _$CastDetailsDMToJson(CastDetailsDM instance) =>
    <String, dynamic>{
      'name': instance.name,
      'characterName': instance.characterName,
      'urlSmallImage': instance.urlSmallImage,
      'imdbCode': instance.imdbCode,
    };
