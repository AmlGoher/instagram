// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram/shared/Colors.dart';

import '../Features/authentication/data/model/user_model.dart';

class CircleAvatarwidget extends StatelessWidget {
  final String circleProfileLink;
  const CircleAvatarwidget({super.key, required this.circleProfileLink});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SizedBox(
            width: 80,
            height: 80,
            child: ClipOval(
              child: Image.asset(
                circleProfileLink,
              ),
            )));
  }
}

class PostWidget extends StatelessWidget {
  final String postimage;
  final String profileimage;
  final String puplishername;
  final bool isSponserd;

  const PostWidget(
      {super.key,
      required this.postimage,
      required this.profileimage,
      required this.puplishername,
      required this.isSponserd});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatarwidget(
                      circleProfileLink: profileimage,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          puplishername,
                          style: TextStyle(fontSize: 19, color: primaryColor),
                        ),
                        Text(
                          "${isSponserd ? "Sponserd" : "NotSponserd"} ",
                          style: TextStyle(fontSize: 14, color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_horiz,
                color: primaryColor,
                size: 31,
              )
            ],
          ),
        ),
        Image.asset(postimage),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined, size: 35),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  IconButton(
                    icon: Icon(Icons.wechat_rounded, size: 35),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  IconButton(
                    icon: Icon(Icons.near_me_outlined, size: 35),
                    onPressed: () {},
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border_sharp, size: 35),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  "36.752 views",
                  style: TextStyle(fontSize: 19, color: primaryColor),
                ),
                Text(
                  "$puplishername   Hello Hello",
                  style: TextStyle(fontSize: 22, color: primaryColor),
                ),
                TextButton(
                  style: ButtonStyle(
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 14, color: primaryColor))),
                  onPressed: () {},
                  child: Text("show Comments (35)"),
                ),
                Text(
                  "14 minutes ago",
                  style: TextStyle(fontSize: 10, color: primaryColor),
                ),
                Divider(
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// // import 'package:authentication_repository/authentication_repository.dart';
// // import 'package:cache/cache.dart';
// // import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// // import 'package:flutter/foundation.dart' show kIsWeb;
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:meta/meta.dart';

