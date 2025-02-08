import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/edite_profile/data_sources/edite_profile_data_source_impl.dart';
import 'package:movie_app/domain/edite_profile/repositories/data_source/edite_profile_data_source.dart';
import '../../data/home/datasources/home_remote_data_source_impl.dart';
import '../../domain/home/repositories/datasources/home_remote_data_source.dart';
import 'inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
void configureDependencies() {
  getIt.registerSingleton<HomeRemoteDataSource>( HomeRemoteDataSourceImpl());
  getIt.registerLazySingleton<EditeProfileDataSource>(() => EditeProfileDataSourceImpl());
  getIt.init();
}
