import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/utils/app_routes.dart';
import 'package:movie_app/utils/app_theme.dart';
import 'UI/Authentication/ForgetPassword/forget_password_screen.dart';
import 'UI/Authentication/Login/login_screen.dart';
import 'UI/onboarding_screen.dart';

void main(){
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoarding,
      routes: {
        AppRoutes.onBoarding:(context)=>const OnboardingScreen(),
        AppRoutes.forgetPasswordRoute: (context) => ForgetPasswordScreen(),
        AppRoutes.loginRoute: (context) => LoginScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
     
  }
}