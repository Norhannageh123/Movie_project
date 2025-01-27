import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/Authentication/Login/login_screen.dart';
import 'package:movie_app/UI/onBoarding.dart';
import 'package:movie_app/Utls/app_routes.dart';
import 'package:movie_app/Utls/app_theme.dart';

void main(){
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRoute,
      routes: {
       AppRoutes.onBoarding:(context)=>const OnboardingScreen(),
        AppRoutes.loginRoute:(context)=>const LoginScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
     
  }
}