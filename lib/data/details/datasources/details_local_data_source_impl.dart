// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
//
// import 'package:movie_app/domain/details/entities/details_response_entity.dart';
// import 'package:movie_app/domain/details/repositories/data_source/details_local_data_source.dart';
//
// @Injectable(as:DetailsLocalDataSource)
// class DetailsLocalDataSourceImpl implements DetailsLocalDataSource{
//   @override
//   void cachingMovie(int id,MovieDetailsEntity movieDetailsEntity) async{
//     final movieBox=await Hive.openBox("SavedMovies");
//     await movieBox.put("Movies",movieDetailsEntity);
//     movieBox.close();
//     print("success");
//   }
//
//   @override
//   Future<List<MovieDetailsEntity>> getCachingMovie()async {
//     // final movieBox=await Hive.openBox("SavedMovies");
//     // return movieBox.get("Movies");
//     final movieBox = await Hive.openBox<MovieDetailsEntity>("SavedMovies");
//     return movieBox.values.toList();
//   }
// }
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/entities/details_response_entity.dart';
import 'package:movie_app/domain/details/repositories/data_source/details_local_data_source.dart';

@Injectable(as: DetailsLocalDataSource)
class DetailsLocalDataSourceImpl implements DetailsLocalDataSource {
  Box<MovieDetailsEntity>? _movieBox; // Nullable box
  Box<MovieDetailsEntity>? historyBox; // Nullable box

  Future<void> _initBox() async {
    _movieBox ??= Hive.isBoxOpen("SavedMovies")
          ? Hive.box<MovieDetailsEntity>("SavedMovies")
          : await Hive.openBox<MovieDetailsEntity>("SavedMovies");
  }

  @override
  Future<void> cachingMovie(int id, MovieDetailsEntity movieDetailsEntity) async {
    await _initBox(); // Ensure the box is initialized
    await _movieBox!.put(id, movieDetailsEntity); // Use `id` as the key
    print("Movie cached successfully!");
  }
  @override
  Future<List<MovieDetailsEntity>> getCachingMovie() async {
    await _initBox(); // Ensure the box is initialized
    return _movieBox!.values.toList();
  }
  @override
  Future<void> deleteMovieFromCaching(int id) async {
    await _initBox(); // Ensure the box is initialized
    await _movieBox!.delete(id);
  }

  Future<void> historyInitBox() async {
    historyBox ??= Hive.isBoxOpen("HistoryMovies")
        ? Hive.box<MovieDetailsEntity>("HistoryMovies")
        : await Hive.openBox<MovieDetailsEntity>("HistoryMovies");
  }

  @override
  Future<void> historyMovies(int id, MovieDetailsEntity movieDetailsEntity) async {
    await historyInitBox(); // Ensure the box is initialized
    await historyBox!.put(id, movieDetailsEntity); // Use `id` as the key
    print("Movie history saved successfully!");
  }

  @override
  Future<List<MovieDetailsEntity>> getHistoryMovies()async {
    await historyInitBox(); // Ensure the box is initialized
    return historyBox!.values.toList();
  }

}

