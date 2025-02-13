import 'package:movie_app/domain/details/entities/details_response_entity.dart';

class DetailsResponseDm extends DetailsResponseEntity {
  DetailsResponseDm({
    super.status,
    super.statusMessage,
    super.data,
    super.meta,
  });
  DetailsResponseDm.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? DataDetailsDM.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? MetaDetailsDM.fromJson(json['@meta']) : null;
  }
}

class MetaDetailsDM extends MetaDetailsEntity {
  MetaDetailsDM({
    super.serverTime,
    super.serverTimezone,
    super.apiVersion,
    super.executionTime,
  });
  MetaDetailsDM.fromJson(dynamic json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
}

class DataDetailsDM extends DataDetailsEntity{
  DataDetailsDM({
      super.movie,});

  DataDetailsDM.fromJson(dynamic json) {
    movie = json['movie'] != null ? MovieDetailsDM.fromJson(json['movie']) : null;
  }
 


}

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

  MovieDetailsDM.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    mediumScreenshotImage1 = json['medium_screenshot_image1'];
    mediumScreenshotImage2 = json['medium_screenshot_image2'];
    mediumScreenshotImage3 = json['medium_screenshot_image3'];
    largeScreenshotImage1 = json['large_screenshot_image1'];
    largeScreenshotImage2 = json['large_screenshot_image2'];
    largeScreenshotImage3 = json['large_screenshot_image3'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(CastDetailsDM.fromJson(v));
      });
    }
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(TorrentsDetailsDM.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
}


class TorrentsDetailsDM extends TorrentsDetailsEntity{
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
      super.dateUploadedUnix,});

  TorrentsDetailsDM.fromJson(dynamic json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
}

class CastDetailsDM extends CastDetailsEntity {
  CastDetailsDM({
      super.name, 
      super.characterName, 
      super.urlSmallImage, 
      super.imdbCode,});

  CastDetailsDM.fromJson(dynamic json) {
    name = json['name'];
    characterName = json['character_name'];
    urlSmallImage = json['url_small_image'];
    imdbCode = json['imdb_code'];
  }

}