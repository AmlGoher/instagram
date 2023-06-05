// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/shared/Colors.dart';

class Chat_Component extends StatelessWidget {
  const Chat_Component({super.key});

  @override
  Widget build(BuildContext context) {
    // final Object? passedemail = ModalRoute.of(context)!.settings.arguments;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, "chat_bubble_page",);
          },
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 450,
              height: 94,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/post1.jfif"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Aml Gohar",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Hi,good Afternoon",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          textBaseline: TextBaseline.alphabetic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                          ),
                          Text(
                            "5w",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 36,
                      )),
                ],
              )),
        ),
        Divider(
          thickness: 1,
          color: secondaryColor,
          indent: 8,
          endIndent: 8,
        ),
      ],
    );
  }
}
