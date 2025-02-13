// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/cupertino.dart' as _i719;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/details/datasources/details_local_data_source_impl.dart'
    as _i555;
import '../../data/details/datasources/details_remote_data_source_impl.dart'
    as _i444;
import '../../data/details/repository/details_repo_impl.dart' as _i63;
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
import '../../data/reset_password/dataSources/reset_remote_data_source_impl.dart'
    as _i870;
import '../../data/reset_password/repositories/reset_repository_impl.dart'
    as _i929;
import '../../domain/details/repositories/data_source/details_local_data_source.dart'
    as _i649;
import '../../domain/details/repositories/data_source/details_remote_data_source.dart'
    as _i477;
import '../../domain/details/repositories/repo/details_repo.dart' as _i949;
import '../../domain/details/usecase/details_use_case.dart' as _i15;
import '../../domain/edite_profile/repositories/data_source/edite_profile_data_source.dart'
    as _i511;
import '../../domain/edite_profile/repositories/repository/edite_profile_repository.dart'
    as _i548;
import '../../domain/edite_profile/use_cases/edite_profile_use_case.dart'
    as _i912;
import '../../domain/home/repositories/datasources/home_remote_data_source.dart'
    as _i249;
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
import '../../domain/reset_password/repositories/data_source/reset_remote_data_source.dart'
    as _i914;
import '../../domain/reset_password/repositories/repository/reset_repository.dart'
    as _i1021;
import '../../domain/reset_password/usecases/reset_use_case.dart' as _i339;
import '../../feature/ui/auth/login/cubit/login_view_model.dart' as _i761;
import '../../feature/ui/auth/login/cubit/token_manager.dart' as _i734;
import '../../feature/ui/auth/register/cubit/register_view_model.dart' as _i552;
import '../../feature/ui/auth/reset_password/cubit/reset_view_model.dart'
    as _i1039;
import '../../feature/ui/auth/reset_password/reset_password_screen.dart'
    as _i850;
import '../../feature/ui/home/details_screen/cubit/details_view_model.dart'
    as _i731;
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
    gh.factory<_i914.ResetRemoteDataSource>(
        () => _i870.ResetRemoteDataSourceImpl());
    gh.factory<_i850.ResetPasswordScreen>(
        () => _i850.ResetPasswordScreen(key: gh<_i719.Key>()));
    gh.factory<_i100.RegisterRemoteDataSource>(
        () => _i195.RegisterRemoteDataSourceImpl());
    gh.factory<_i649.DetailsLocalDataSource>(
        () => _i555.DetailsLocalDataSourceImpl());
    gh.factory<_i511.EditeProfileDataSource>(
        () => _i885.EditeProfileDataSourceImpl());
    gh.factory<_i477.DetailsRemoteDataSource>(
        () => _i444.DetailsRemoteDataSourceImpl());
    gh.factory<_i297.LoginRemoteDataSource>(
        () => _i1063.LoginRemoteDataSourceImpl());
    gh.factory<_i249.HomeRemoteDataSource>(
        () => _i541.HomeRemoteDataSourceImpl());
    gh.factory<_i949.DetailsRepo>(() => _i63.DetailsRepoImpl(
        detailsRemoteDataSource: gh<_i477.DetailsRemoteDataSource>()));
    gh.factory<_i15.DetailsUseCase>(
        () => _i15.DetailsUseCase(detailsRepo: gh<_i949.DetailsRepo>()));
    gh.factory<_i857.RegisterRepository>(() => _i7.RegisterRepositoryImpl(
        registerRemoteDataSource: gh<_i100.RegisterRemoteDataSource>()));
    gh.factory<_i429.LoginRepository>(() => _i335.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i297.LoginRemoteDataSource>()));
    gh.factory<_i1021.ResetRepository>(() => _i929.ResetRepositoryImpl(
        resetRemoteDataSource: gh<_i914.ResetRemoteDataSource>()));
    gh.factory<_i548.EditeProfileRepository>(() =>
        _i673.EditeProfileRepositoryImpl(
            editeProfileDataSourceImpl: gh<_i511.EditeProfileDataSource>()));
    gh.factory<_i545.RegisterUseCase>(() => _i545.RegisterUseCase(
        registerRepository: gh<_i857.RegisterRepository>()));
    gh.factory<_i260.HomeRepo>(() => _i985.HomeRepoImpl(
        homeRemoteDataSource: gh<_i249.HomeRemoteDataSource>()));
    gh.factory<_i631.LoginUseCase>(
        () => _i631.LoginUseCase(loginRepository: gh<_i429.LoginRepository>()));
    gh.factory<_i339.ResetUseCase>(() =>
        _i339.ResetUseCase(resetRepository: gh<_i1021.ResetRepository>()));
    gh.factory<_i731.DetailsViewModel>(() =>
        _i731.DetailsViewModel(detailsUseCase: gh<_i15.DetailsUseCase>()));
    gh.factory<_i756.HomeUseCase>(
        () => _i756.HomeUseCase(homeRepo: gh<_i260.HomeRepo>()));
    gh.factory<_i552.RegisterViewModel>(() =>
        _i552.RegisterViewModel(registerUseCase: gh<_i545.RegisterUseCase>()));
    gh.factory<_i60.HomeViewModel>(
        () => _i60.HomeViewModel(homeUseCase: gh<_i756.HomeUseCase>()));
    gh.factory<_i912.EditeProfileUseCase>(() => _i912.EditeProfileUseCase(
        editeProfileRepository: gh<_i548.EditeProfileRepository>()));
    gh.factory<_i16.EditeProfileViewModel>(() => _i16.EditeProfileViewModel(
          editeProfileUseCase: gh<_i912.EditeProfileUseCase>(),
          tokenManager: gh<_i734.TokenManager>(),
        ));
    gh.factory<_i1039.ResetViewModel>(
        () => _i1039.ResetViewModel(resetUseCase: gh<_i339.ResetUseCase>()));
    gh.factory<_i761.LoginViewModel>(() => _i761.LoginViewModel(
          loginUseCase: gh<_i631.LoginUseCase>(),
          editeProfileViewModel: gh<_i16.EditeProfileViewModel>(),
        ));
    return this;
  }
}
