class CategoriesResponseEntity {
  String? status;
  String? statusMessage;
  CategoryDataEntity? data;
  CategoriesMetaEntity? meta;

  CategoriesResponseEntity(
      {this.status, this.statusMessage, this.data, this.meta});
}

class CategoryDataEntity {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<CategoriesMoviesEntity>? movies;

  CategoryDataEntity({this.movieCount, this.limit, this.pageNumber, this.movies});
}

class CategoriesMoviesEntity {
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
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<CategoriesTorrentsEntity>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  CategoriesMoviesEntity(
      {this.id,
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
      this.summary,
      this.descriptionFull,
      this.synopsis,
      this.ytTrailerCode,
      this.language,
      this.mpaRating,
      this.backgroundImage,
      this.backgroundImageOriginal,
      this.smallCoverImage,
      this.mediumCoverImage,
      this.largeCoverImage,
      this.state,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix});
}

class CategoriesTorrentsEntity {
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

  CategoriesTorrentsEntity(
      {this.url,
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
      this.dateUploadedUnix});
}

class CategoriesMetaEntity {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  CategoriesMetaEntity(
      {this.serverTime,
      this.serverTimezone,
      this.apiVersion,
      this.executionTime});
}