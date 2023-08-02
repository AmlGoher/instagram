import 'package:flutter/material.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Screens/MainMobileDesign.dart';

import '../Screens/MainWebDesign.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (buildContext, boxConstraints) {
        if (boxConstraints.maxWidth > 600) {
          return const WebDesign();
        } else {
         return  const    MobilDesign();
        }
      },
    );
  }
}
