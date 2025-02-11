// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movie_app/feature/ui/home/tabs/profile_tab/cubit/edite_profile_view_model.dart';

import '../../data/edite_profile/data_sources/edite_profile_data_source_impl.dart'
    as _i885;
import '../../data/edite_profile/repositories/edite_profile_repository_impl.dart'
    as _i673;
import '../../data/home/datasources/home_remote_data_source_impl.dart' as _i541;
import '../../data/home/repositories/home_repo_impl.dart' as _i985;
import '../../data/login/repositories/login_%20data_source/login_remote_data_source/login_remote_data_source_impl.dart'
    as _i1063;
import '../../data/login/repositories/login_repository/login_repository_impl.dart'
    as _i335;
import '../../data/register/repositories/register_data_source/regitser_remote_data_source/register_remote_data_source_impl.dart'
    as _i195;
import '../../data/register/repositories/register_repository/register_repository_impl.dart'
    as _i7;
import '../../domain/edite_profile/repositories/data_source/edite_profile_data_source.dart'
    as _i511;
import '../../domain/edite_profile/repositories/repository/edite_profile_repository.dart'
    as _i548;
import '../../domain/edite_profile/use_cases/edite_profile_use_case.dart'
    as _i912;
import '../../domain/home/repositories/repo/home_repo.dart' as _i260;
import '../../domain/home/usecases/home_use_case.dart' as _i756;
import '../../domain/login/repositories/data_source/remote_data_source/login_remote_data_source.dart'
    as _i297;
import '../../domain/login/repositories/repository/login_repository.dart'
    as _i429;
import '../../domain/login/usecases/login_use_case.dart' as _i631;
import '../../domain/register/repositories/data_source/remote_data_source/register_remote_data_source.dart'
    as _i100;
import '../../domain/register/repositories/repository/register_repository.dart'
    as _i857;
import '../../domain/register/usecases/register_use_case.dart' as _i545;
import '../../feature/ui/auth/login/cubit/login_view_model.dart' as _i761;
import '../../feature/ui/auth/register/cubit/register_view_model.dart' as _i552;
import '../../feature/ui/home/tabs/home_tab/cubit/home_view_model.dart' as _i60;
import '../../feature/ui/home/tabs/profile_tab/cubit/edite_profile_view_model.dart'
    as _i16;

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
    gh.factory<_i541.HomeRemoteDataSourceImpl>(
        () => _i541.HomeRemoteDataSourceImpl());
    gh.factory<_i100.RegisterRemoteDataSource>(
        () => _i195.RegisterRemoteDataSourceImpl());
    gh.factory<_i511.EditeProfileDataSource>(
        () => _i885.EditeProfileDataSourceImpl());
    gh.factory<_i548.EditeProfileRepository>(() =>
        _i673.EditeProfileRepositoryImpl(
            editeProfileDataSourceImpl:
                gh<_i885.EditeProfileDataSourceImpl>()));
    gh.factory<_i260.HomeRepo>(() => _i985.HomeRepoImpl(
        homeRemoteDataSourceImpl: gh<_i541.HomeRemoteDataSourceImpl>()));
    gh.factory<_i297.LoginRemoteDataSource>(
        () => _i1063.LoginRemoteDataSourceImpl());
    gh.factory<_i756.HomeUseCase>(
        () => _i756.HomeUseCase(homeRepo: gh<_i260.HomeRepo>()));
    gh.factory<_i857.RegisterRepository>(() => _i7.RegisterRepositoryImpl(
        registerRemoteDataSource: gh<_i100.RegisterRemoteDataSource>()));
    gh.factory<_i60.HomeViewModel>(
        () => _i60.HomeViewModel(homeUseCase: gh<_i756.HomeUseCase>()));
    gh.factory<_i912.EditeProfileUseCase>(() => _i912.EditeProfileUseCase(
        editeProfileRepository: gh<_i548.EditeProfileRepository>()));
    gh.factory<_i429.LoginRepository>(() => _i335.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i297.LoginRemoteDataSource>()));
    gh.factory<_i16.EditeProfileViewModel>(() => _i16.EditeProfileViewModel(
        editeProfileUseCase: gh<_i912.EditeProfileUseCase>()));
    gh.factory<_i545.RegisterUseCase>(() => _i545.RegisterUseCase(
        registerRepository: gh<_i857.RegisterRepository>()));
    gh.factory<_i631.LoginUseCase>(
        () => _i631.LoginUseCase(loginRepository: gh<_i429.LoginRepository>()));
    gh.factory<_i552.RegisterViewModel>(() =>
        _i552.RegisterViewModel(registerUseCase: gh<_i545.RegisterUseCase>()));
    gh.factory<_i761.LoginViewModel>(
        () => _i761.LoginViewModel(
    loginUseCase: gh<_i631.LoginUseCase>(),
    editeProfileViewModel: gh<EditeProfileViewModel>(), 
)
    );
    return this;
  }
}
