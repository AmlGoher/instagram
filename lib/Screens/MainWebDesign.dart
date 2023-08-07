// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Screens/addPost.dart';
import 'package:instagram/Screens/favorit.dart';
import 'package:instagram/Screens/profile.dart';
import 'package:instagram/Screens/search.dart';
import 'package:instagram/shared/Colors.dart';

import '../core/colors/constatnt_color.dart';

class WebDesign extends StatefulWidget {
  const WebDesign({super.key});

  @override
  State<WebDesign> createState() => _WebDesignState();
}

class _WebDesignState extends State<WebDesign> {
  final PageController _pageController = PageController();
  int currentActiveColor = 0;
  move2screens(int indexx) {
    _pageController.jumpToPage(indexx);
    setState(() {
      currentActiveColor = indexx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.mobileBackgroundColor,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/images/instagram.svg",
              color: ConstantColors.kWhiteColor,
              height: 35,
            ),
            SizedBox(
              width: 3,
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: ConstantColors.kWhiteColor,
              ),
              onPressed: () {
                SimpleDialog(
                  contentPadding: EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  backgroundColor: ConstantColors.kGreyColor,
                  children: <Widget>[
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Follow',
                            style: TextStyle(color: ConstantColors.kWhiteColor),
                          ),
                          Icon(
                            Icons.people_alt_outlined,
                            color: ConstantColors.kWhiteColor,
                          )
                        ],
                      ),
                    ),
                    SimpleDialogOption(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Favorite',
                            style: TextStyle(color: ConstantColors.kWhiteColor),
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: ConstantColors.kWhiteColor,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    move2screens(0);
                  },
                  icon: Icon(
                    Icons.home,
                    color:
                        currentActiveColor == 0 ? ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                  )),
              IconButton(
                  onPressed: () {
                    move2screens(1);
                    
                  },
                  icon: Icon(
                    Icons.search,
                    color:
                        currentActiveColor == 1 ? ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                  )),
              IconButton(
                  onPressed: () {
                     move2screens(2);
                  },
                  icon: Icon(
                    Icons.linked_camera_outlined,
                    color:
                        currentActiveColor == 2 ? ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                  )),
              SizedBox(
                width: 8,
              ),
              IconButton(
                  onPressed: () {
                    move2screens(2);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color:
                        currentActiveColor == 2 ?  ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                  )),
              IconButton(
                  onPressed: () {
                    move2screens(4);
                  },
                  icon: Icon(
                    Icons.person,
                    color:
                        currentActiveColor ==4 ?  ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                  )),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {
                  move2screens(4);
                },
                child: SvgPicture.asset(
                  "assets/images/icons8-facebook-messenger.svg",
                  color:
                      currentActiveColor == 4 ?  ConstantColors.kWhiteColor : ConstantColors.kGreyColor,
                ),
              ),
              SizedBox(
                width: 8,
              )
            ],
          )
        ],
      ),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Home(),
          SearchScreen(),
          AddPostScreen(),
          FavouritScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
