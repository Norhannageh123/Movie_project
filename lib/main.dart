import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Home/home_screen.dart';
import 'package:movie_app/UI/onboarding_screen.dart';
import 'package:movie_app/ui/auth/Register/register.dart';
import 'package:movie_app/ui/update_profile_screen.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_theme.dart';
import 'ui/auth/Login/login_screen.dart';



void main(){
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.updateProfileRoute,
      routes: {
        AppRoutes.onBoarding:(context)=>const OnboardingScreen(),
        AppRoutes.loginRoute:(context)=>const LoginScreen(),
        AppRoutes.registerRoute:(context)=>const Register(),
        AppRoutes.updateProfileRoute:(context)=>const UpdateProfileScreen(),
        AppRoutes.homeRoute:(context)=> const HomeScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
     
  }
}