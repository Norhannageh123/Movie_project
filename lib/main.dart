import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/UI/tabs/search/search_tab.dart';
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
      initialRoute: AppRoutes.searchRoute,
      routes: {
        AppRoutes.searchRoute: (context) => SearchTab(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
     
  }
}