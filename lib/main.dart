import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/onBoarding.dart';
import 'package:movie_app/Utls/app_routes.dart';
import 'package:movie_app/Utls/app_theme.dart';

import 'UI/update_profile_screen.dart';

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
        AppRoutes.updateProfileRoute:(context)=> const UpdateProfileScreen(),

      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
     
  }
}