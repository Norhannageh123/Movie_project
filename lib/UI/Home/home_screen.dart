import 'package:flutter/material.dart';
import 'package:movie_app/UI/Home/Tabs/BrowseTab/browseTabUi.dart';
import 'package:movie_app/UI/Home/Tabs/SearchTab/searchTabUi.dart';
import 'package:movie_app/UI/Home/Tabs/homeTab/homeTabUi.dart';
import 'package:movie_app/UI/Home/Tabs/profileTab/profileTabUi.dart';
import 'package:movie_app/utils/app_colors.dart';
import 'package:movie_app/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width*0.02,
          vertical: height*0.02,
        ), 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          color: AppColors.babyBlackColor, 
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), 
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent, 
            elevation: 0, 
            selectedItemColor: Colors.transparent, 
            unselectedItemColor: Colors.transparent, 
            items: [
              buildBottomNavItem(AppImages.homeWhite, AppImages.homeYellow, 0),
              buildBottomNavItem(AppImages.searchWhite, AppImages.searchYellow, 1),
              buildBottomNavItem(AppImages.browseWhite, AppImages.browseYellow, 2),
              buildBottomNavItem(AppImages.profileWhite, AppImages.profileYellow, 3),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavItem(
      String image, String fullImage, int index) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(selectedIndex == index ? fullImage : image),
        color: selectedIndex == index ? Colors.yellow : Colors.white, 
      ),
      label: "",
    );
  }
}