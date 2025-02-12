import 'package:movie_app/data/details/datasources/details_local_data_source_impl.dart';
import 'package:movie_app/data/details/datasources/details_remote_data_source_impl.dart';
import 'package:movie_app/domain/details/repositories/repo/details_repo.dart';

class DetailsRepoImpl implements DetailsRepo{
  ///any repo must know the dataSource
  ///so it should have object from remote and local data sources

  DetailsLocalDataSourceImpl detailsLocalDataSource;
  DetailsRemoteDataSourceImpl detailsRemoteDataSource;

  DetailsRepoImpl({required this.detailsLocalDataSource,
  required this.detailsRemoteDataSource});

  @override
  void cachingMovie() {
    // TODO: implement cachingMovie
  }

  @override
  getCachingMovie() {
    // TODO: implement getCachingMovie
    throw UnimplementedError();
  }

}