import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/details/repositories/data_source/details_local_data_source.dart';

@Injectable(as:DetailsLocalDataSource)
class DetailsLocalDataSourceImpl implements DetailsLocalDataSource{
  @override
  void cachingMovie() {
    print("");
  }

  @override
  void getCachingMovie() {
    // TODO: implement getCachingMovie
    print("");
  }
}