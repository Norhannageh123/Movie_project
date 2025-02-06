// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/login/repositories/login_%20data_source/login_remote_data_source/login_remote_data_source_impl.dart'
    as _i1063;
import '../../data/login/repositories/login_repository/login_repository_impl.dart'
    as _i335;
import '../../domain/login/repositories/data_source/remote_data_source/login_remote_data_source.dart'
    as _i297;
import '../../domain/login/repositories/repository/login_repository.dart'
    as _i429;
import '../../domain/login/usecases/login_use_case.dart' as _i631;
import '../../feature/ui/auth/login/cubit/login_view_model.dart' as _i761;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i297.LoginRemoteDataSource>(
        () => _i1063.LoginRemoteDataSourceImpl());
    gh.factory<_i429.LoginRepository>(() => _i335.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i297.LoginRemoteDataSource>()));
    gh.factory<_i631.LoginUseCase>(
        () => _i631.LoginUseCase(loginRepository: gh<_i429.LoginRepository>()));
    gh.factory<_i761.LoginViewModel>(
        () => _i761.LoginViewModel(loginUseCase: gh<_i631.LoginUseCase>()));
    return this;
  }
}
