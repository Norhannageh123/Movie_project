
class MovieSuggestionsResponseEntity {
  MovieSuggestionsResponseEntity({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  String? status;
  String? statusMessage;
  MoviesSuggestionsDataEntity? data;
  MoviesSuggestionsMetaEntity? meta;


}

class MoviesSuggestionsMetaEntity {
  MoviesSuggestionsMetaEntity({
      this.serverTime, 
      this.serverTimezone, 
      this.apiVersion, 
      this.executionTime,});

  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;


}

class MoviesSuggestionsDataEntity {
  MoviesSuggestionsDataEntity({
      this.movieCount, 
      this.movies,});

  int? movieCount;
  List<MovieSuggestionsEntity>? movies;

}

class MovieSuggestionsEntity {
  MovieSuggestionsEntity({
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
      this.state, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

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
  String? state;
  List<MoviesSuggestionsTorrentsEntity>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;


}

class MoviesSuggestionsTorrentsEntity {
  MoviesSuggestionsTorrentsEntity({
      this.url, 
      this.hash, 
      this.quality, 
      this.isRepack, 
      this.videoCodec, 
      this.bitDepth, 
      this.audioChannels, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  String? url;
  String? hash;
  String? quality;
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


}