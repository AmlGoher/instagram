// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/shared/shared_Chat_Component.dart';

class chat_home_screen extends StatelessWidget {
  const chat_home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title:   Text(
                  "Chat",textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,),
                ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search,size:36),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.settings,size:36),
        ),

      ],),
      body: Column(
        children: [
          Chat_Component(),
           Chat_Component(),
        ],
      ),
    ));
  }
}