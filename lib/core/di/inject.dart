import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
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
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
  getIt.init();
}
