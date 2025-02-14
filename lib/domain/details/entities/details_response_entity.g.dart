// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsEntity(
      id: fields[1] as int?,
      title: fields[2] as String?,
      year: fields[3] as int?,
      rating: fields[4] as double?,
      runtime: fields[10] as int?,
      like_count: fields[6] as int?,
      description_full: fields[7] as String?,
      medium_cover_image: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.runtime)
      ..writeByte(6)
      ..write(obj.like_count)
      ..writeByte(7)
      ..write(obj.description_full)
      ..writeByte(8)
      ..write(obj.medium_cover_image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsResponseEntity _$DetailsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DetailsResponseEntity(
      status: json['status'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] == null
          ? null
          : DataDetailsEntity.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : MetaDetailsEntity.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsResponseEntityToJson(
        DetailsResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
      'meta': instance.meta,
    };

DataDetailsEntity _$DataDetailsEntityFromJson(Map<String, dynamic> json) =>
    DataDetailsEntity(
      movie: json['movie'] == null
          ? null
          : MovieDetailsEntity.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataDetailsEntityToJson(DataDetailsEntity instance) =>
    <String, dynamic>{
      'movie': instance.movie,
    };

MovieDetailsEntity _$MovieDetailsEntityFromJson(Map<String, dynamic> json) =>
    MovieDetailsEntity(
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
      like_count: (json['like_count'] as num?)?.toInt(),
      description_intro: json['description_intro'] as String?,
      description_full: json['description_full'] as String?,
      ytTrailerCode: json['ytTrailerCode'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpaRating'] as String?,
      background_image: json['background_image'] as String?,
      background_image_original: json['background_image_original'] as String?,
      small_cover_image: json['small_cover_image'] as String?,
      medium_cover_image: json['medium_cover_image'] as String?,
      large_cover_image: json['large_cover_image'] as String?,
      medium_screenshot_image1: json['medium_screenshot_image1'] as String?,
      medium_screenshot_image2: json['medium_screenshot_image2'] as String?,
      medium_screenshot_image3: json['medium_screenshot_image3'] as String?,
      large_screenshot_image1: json['large_screenshot_image1'] as String?,
      large_screenshot_image2: json['large_screenshot_image2'] as String?,
      large_screenshot_image3: json['large_screenshot_image3'] as String?,
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

Map<String, dynamic> _$MovieDetailsEntityToJson(MovieDetailsEntity instance) =>
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
      'like_count': instance.like_count,
      'description_intro': instance.description_intro,
      'description_full': instance.description_full,
      'ytTrailerCode': instance.ytTrailerCode,
      'language': instance.language,
      'mpaRating': instance.mpaRating,
      'background_image': instance.background_image,
      'background_image_original': instance.background_image_original,
      'small_cover_image': instance.small_cover_image,
      'medium_cover_image': instance.medium_cover_image,
      'large_cover_image': instance.large_cover_image,
      'medium_screenshot_image1': instance.medium_screenshot_image1,
      'medium_screenshot_image2': instance.medium_screenshot_image2,
      'medium_screenshot_image3': instance.medium_screenshot_image3,
      'large_screenshot_image1': instance.large_screenshot_image1,
      'large_screenshot_image2': instance.large_screenshot_image2,
      'large_screenshot_image3': instance.large_screenshot_image3,
      'cast': instance.cast,
      'torrents': instance.torrents,
      'dateUploaded': instance.dateUploaded,
      'dateUploadedUnix': instance.dateUploadedUnix,
    };

MetaDetailsEntity _$MetaDetailsEntityFromJson(Map<String, dynamic> json) =>
    MetaDetailsEntity(
      serverTime: (json['serverTime'] as num?)?.toInt(),
      serverTimezone: json['serverTimezone'] as String?,
      apiVersion: (json['apiVersion'] as num?)?.toInt(),
      executionTime: json['executionTime'] as String?,
    );

Map<String, dynamic> _$MetaDetailsEntityToJson(MetaDetailsEntity instance) =>
    <String, dynamic>{
      'serverTime': instance.serverTime,
      'serverTimezone': instance.serverTimezone,
      'apiVersion': instance.apiVersion,
      'executionTime': instance.executionTime,
    };

TorrentsDetailsEntity _$TorrentsDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    TorrentsDetailsEntity(
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

Map<String, dynamic> _$TorrentsDetailsEntityToJson(
        TorrentsDetailsEntity instance) =>
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

CastDetailsEntity _$CastDetailsEntityFromJson(Map<String, dynamic> json) =>
    CastDetailsEntity(
      name: json['name'] as String?,
      character_name: json['character_name'] as String?,
      urlSmallImage: json['urlSmallImage'] as String?,
      imdb_code: json['imdb_code'] as String?,
    );

Map<String, dynamic> _$CastDetailsEntityToJson(CastDetailsEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'character_name': instance.character_name,
      'urlSmallImage': instance.urlSmallImage,
      'imdb_code': instance.imdb_code,
    };
