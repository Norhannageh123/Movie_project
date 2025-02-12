import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/core/cache/cache_helper.dart';
import 'package:movie_app/core/cubit_language/bloc_observer.dart';
import 'package:movie_app/core/cubit_language/cubit_language.dart';
import 'package:movie_app/core/di/inject.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_theme.dart';
import 'package:movie_app/feature/ui/auth/login/login_screen.dart';
import 'package:movie_app/feature/ui/auth/register/register.dart';
import 'package:movie_app/feature/ui/home/details_screen/details_screen.dart';
import 'package:movie_app/feature/ui/home/home_screen.dart';
import 'package:movie_app/feature/ui/home/tabs/browse_tab/browseTabUi.dart';
import 'package:movie_app/feature/ui/onboarding_screen.dart';
import 'package:movie_app/feature/ui/update_profile_screen.dart';

import 'feature/ui/auth/reset_password/reset_password_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper().init();
  setupLocator();
  configureDependencies();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, String>(
        builder: (context, language) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.homeRoute,
            routes: {
              AppRoutes.onBoarding: (context) => const OnboardingScreen(),
              AppRoutes.loginRoute: (context) => const LoginScreen(),
              AppRoutes.registerRoute: (context) => const Register(),
              AppRoutes.updateProfileRoute: (context) => const UpdateProfileScreen(),
              AppRoutes.homeRoute: (context) => const HomeScreen(),
              AppRoutes.browseRoute: (context) => BrowseTab(),
              AppRoutes.detailsScreenRoute:(context)=> DetailsScreen(),
              AppRoutes.resetPasswordRoute: (context) => const ResetPasswordScreen(),

            },
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(language), 
          );
        },
      ),
    );
  }
}
