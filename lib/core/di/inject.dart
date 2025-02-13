import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/cache/cache_helper.dart';
import 'package:movie_app/data/edite_profile/data_sources/edite_profile_data_source_impl.dart';
import '../../data/reset_password/dataSources/reset_remote_data_source_impl.dart';
import '../../domain/reset_password/repositories/data_source/reset_remote_data_source.dart';
import '../../feature/ui/auth/login/cubit/token_manager.dart';
import 'inject.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void setupLocator() {
  getIt.registerLazySingleton<TokenManager>(() => TokenManager(CacheHelper()));
}
void configureDependencies() {
  getIt.registerFactory<EditeProfileDataSourceImpl>(() => EditeProfileDataSourceImpl());
  getIt.init(); //
}
