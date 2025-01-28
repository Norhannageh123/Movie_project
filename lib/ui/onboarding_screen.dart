import 'package:flutter/material.dart';
import 'package:movie_app/model/slider_model.dart';
import 'package:movie_app/ui/onboarding_slider.dart';



class OnboardingScreen extends StatefulWidget {
   const OnboardingScreen({super.key});


  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage=0;
  late PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //PageView is used to make our screen horizontal scroll
          Expanded(
            child: PageView.builder(controller: controller,itemBuilder: (context,index){

              return OnboardingSlider(
                image: getSlides(context)[index].image,
                title: getSlides(context)[index].title,
                desc: getSlides(context)[index].description,
                currentPage: index,
                controller: controller,

              );
            },
            onPageChanged: (index){
              currentPage=index;
              setState(() {

              });
            },
              itemCount: getSlides(context).length,
            ),
          )
        ],
      )
    );
  }
}
