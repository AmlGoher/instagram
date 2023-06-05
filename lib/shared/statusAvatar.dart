import 'package:flutter/material.dart';
import 'package:instagram/shared/Colors.dart';

class statusclass extends StatelessWidget {
  final String imgpathvar;
  statusclass({super.key, required this.imgpathvar});

  // ignore: prefer_const_constructors
  final kInnerDecoration = BoxDecoration(
    color: mobileBackgroundColor,
    shape: BoxShape.circle,
  );

// border for all 3 colors
  final kGradientBoxDecoration = BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
      shape: BoxShape.circle);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
       const   SizedBox(
          width: 8,
        ),
        GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(1),
              height: 80,
              decoration: kGradientBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.all(1), //width of the border
  child: Container(
                  decoration:
                      kInnerDecoration, // this height forces the container to be a circle
                  child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mobileBackgroundColor,
              ),
               child: CircleAvatar(
                radius: 33,
                backgroundImage: AssetImage(
                       imgpathvar
                      ),),
             ),
                ),
              ),
            ),
           ),
      ],
    );
   
  }
}
