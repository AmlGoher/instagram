// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Screens/addPost.dart';
import 'package:instagram/Screens/favorit.dart';
import 'package:instagram/Screens/profile.dart';
import 'package:instagram/Screens/search.dart';
import 'package:instagram/shared/Colors.dart';

class MobilDesign extends StatefulWidget {
  const MobilDesign({super.key});

  @override
  State<MobilDesign> createState() => _MobilDesignState();
}

class _MobilDesignState extends State<MobilDesign> {
  final PageController _pageController = PageController();
  int activcolorr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          // navigate to the tabed page
          _pageController.jumpToPage(index);
          setState(() {
            activcolorr = index;
          });
        },

        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: activcolorr == 0 ? primaryColor : secondaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: activcolorr == 1 ? primaryColor : secondaryColor),
              label: ""),
        
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined,
                  color: activcolorr ==2? primaryColor : secondaryColor),
              label: ""),
               BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_outlined,
                  color: activcolorr == 3 ? primaryColor : secondaryColor),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: activcolorr == 4? primaryColor : secondaryColor),
              label: ""),
        ],

),
      
     body:  PageView(
        onPageChanged: (index) {},
         physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Home(),
          SearchScreen(),
          AddPostScreen(),
          FavouritScreen(),
          profileScreen(),
        ],
      ),

      
    );
  }
}
