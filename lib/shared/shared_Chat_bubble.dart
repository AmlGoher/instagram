// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:instagram/model/message.dart';
import 'package:instagram/shared/Colors.dart';

class Chatbubbles extends StatelessWidget {
  const Chatbubbles({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Text(
              message.message!,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Chatbubbles_freind extends StatelessWidget {
  const Chatbubbles_freind({
    Key? key,
    required this.message,
  }) : super(key: key);
 final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Text(
              message.message!,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
