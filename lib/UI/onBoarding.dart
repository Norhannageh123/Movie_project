import 'package:flutter/material.dart';
import 'package:movie_app/Utls/app_style.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Text(
          "Hello in Movie App",
          style: AppStyle.yellow20Bold,
        ),
      ),
    );
  }
}
