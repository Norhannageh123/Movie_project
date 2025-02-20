import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';

class CategoriesResponseDM extends CategoriesResponseEntity{
   String?message;

  CategoriesResponseDM(
      {super.status, super.statusMessage, super.data, super.meta,this.message});

  CategoriesResponseDM.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? new CategoryDataDM.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? new CategoriesMetaDM.fromJson(json['@meta']) : null;
  }
}

class CategoryDataDM  extends CategoryDataEntity{
  

  CategoryDataDM({super.movieCount, super.limit, super.pageNumber, super.movies});

  CategoryDataDM.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = <CategoriesMoviesDM>[];
      json['movies'].forEach((v) {
        movies!.add(new CategoriesMoviesDM.fromJson(v));
      });
    }
  }
}

class CategoriesMoviesDM extends CategoriesMoviesEntity{
  CategoriesMoviesDM(
      {super.id,
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
      super.summary,
      super.descriptionFull,
      super.synopsis,
      super.ytTrailerCode,
      super.language,
      super.mpaRating,
      super.backgroundImage,
      super.backgroundImageOriginal,
      super.smallCoverImage,
      super.mediumCoverImage,
      super.largeCoverImage,
      super.state,
      super.torrents,
      super.dateUploaded,
      super.dateUploadedUnix});

  CategoriesMoviesDM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    
    rating = json['rating'] == null ? null : (json['rating'] is int ? (json['rating'] as int).toDouble() : json['rating'] as double);
    runtime = json['runtime'];
    genres = json['genres'].cast<String>();
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = <CategoriesTorrentsDM>[];
      json['torrents'].forEach((v) {
        torrents!.add(new CategoriesTorrentsDM.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
}
}

class CategoriesTorrentsDM extends CategoriesTorrentsEntity {

  CategoriesTorrentsDM(
      {super.url,
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
      super.dateUploadedUnix});

  CategoriesTorrentsDM.fromJson(Map<String, dynamic> json) {
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

class CategoriesMetaDM extends CategoriesMetaEntity {

  CategoriesMetaDM(
      {super.serverTime,
      super.serverTimezone,
      super.apiVersion,
      super.executionTime});

  CategoriesMetaDM.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }
}