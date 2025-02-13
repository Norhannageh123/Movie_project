// الكلاس الرئيسي للاستجابة
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
}

// بيانات الفيلم
class DataDetailsEntity {
  DataDetailsEntity({
    this.movie,
  });

  MovieDetailsEntity? movie;
}

// تفاصيل الفيلم
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
}


// تفاصيل الميتا
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
}

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
      this.dateUploadedUnix,});
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

}

class CastDetailsEntity {
  CastDetailsEntity({
      this.name, 
      this.characterName, 
      this.urlSmallImage, 
      this.imdbCode,});

  String? name;
  String? characterName;
  String? urlSmallImage;
  String? imdbCode;


}