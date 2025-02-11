import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/edite_profile/data_sources/edite_profile_data_source_impl.dart';
import 'inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.registerFactory<EditeProfileDataSourceImpl>(() => EditeProfileDataSourceImpl());
  getIt.init(); // 
}
