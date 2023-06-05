

import 'package:flutter/material.dart';

class FavouritScreen extends StatefulWidget {
  const FavouritScreen({super.key});

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:Text("Favourit Screen"),
        
    ));
  }}