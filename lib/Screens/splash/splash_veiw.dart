import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewWBody extends StatelessWidget {
  final double width, height;
  final Animation<double> logoAnimation;
  final Animation<double> textAnimation;

  const SplashViewWBody(
      {super.key,
      required this.width,
      required this.height,
      required this.logoAnimation,
      required this.textAnimation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated app logo
          TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            tween: Tween<double>(begin: 1.0, end: 0.0),
            builder: (context, value, child) => Transform.translate(
              offset: Offset(0.0, logoAnimation.value * 100),
              child: child,
            ),
            child: SvgPicture.asset(  "assets/images/instagram.svg",   
              width: width * 0.8,
              height: height * 0.2,
            ),
          ),
          const SizedBox(height: 20),

          // Animated text
          TweenAnimationBuilder(
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            tween: Tween<double>(begin: -1.0, end: 0.0),
            builder: (context, value, child) => Transform.translate(
              offset: Offset(0.0, textAnimation.value * 90),
              child: child,
            ),
            child:const Column(
              children:  [
                Text(
                  'Instagram',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 8),
                Text(
                  'With Clean Architecture & BLOC',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}