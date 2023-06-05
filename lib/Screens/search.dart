// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram/shared/Colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// class MyOutlinedButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Widget child;
//   final ButtonStyle? style;
//   final Gradient? gradient;
//   final double thickness;

//   const MyOutlinedButton({
//     Key? key,
//     required this.onPressed,
//     required this.child,
//     this.style,
//     this.gradient,
//     this.thickness = 2,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(gradient: gradient),
//       child: Container(
//         color: Colors.white,
//         margin: EdgeInsets.all(thickness),
//         child: OutlinedButton(
//           onPressed: onPressed,
//           style: style,
//           child: child,
//         ),
//       ),
//     );
//   }
// }
// class CustomSearchDelegate extends SearchDelegate {
// // Demo list to show querying
// List<String> searchTerms = [
// 	"Apple",
// 	"Banana",
// 	"Mango",
// 	"Pear",
// 	"Watermelons",
// 	"Blueberries",
// 	"Pineapples",
// 	"Strawberries"
// ];

// // first overwrite to
// // clear the search text
// @override
// List<Widget>? buildActions(BuildContext context) {
// 	return [
// 	IconButton(
// 		onPressed: () {
// 		query = '';
// 		},
// 		icon: Icon(Icons.clear),
// 	),
// 	];
// }

// // second overwrite to pop out of search menu
// @override
// Widget? buildLeading(BuildContext context) {
// 	return IconButton(
// 	onPressed: () {
// 		close(context, null);
// 	},
// 	icon: Icon(Icons.arrow_back),
// 	);
// }

// // third overwrite to show query result
// @override
// Widget buildResults(BuildContext context) {
// 	List<String> matchQuery = [];
// 	for (var fruit in searchTerms) {
// 	if (fruit.toLowerCase().contains(query.toLowerCase())) {
// 		matchQuery.add(fruit);
// 	}
// 	}
// 	return ListView.builder(
// 	itemCount: matchQuery.length,
// 	itemBuilder: (context, index) {
// 		var result = matchQuery[index];
// 		return ListTile(
// 		title: Text(result),
// 		);
// 	},
// 	);
// }

// // last overwrite to show the
// // querying process at the runtime
// @override
// Widget buildSuggestions(BuildContext context) {
// 	List<String> matchQuery = [];
// 	for (var fruit in searchTerms) {
// 	if (fruit.toLowerCase().contains(query.toLowerCase())) {
// 		matchQuery.add(fruit);
// 	}
// 	}
// 	return ListView.builder(
// 	itemCount: matchQuery.length,
// 	itemBuilder: (context, index) {
// 		var result = matchQuery[index];
// 		return ListTile(
// 		title: Text(result),
// 		);
// 	},
// 	);
// }
// }

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: mobileBackgroundColor,
body: Container(
          decoration: BoxDecoration(
            color:  Color.fromARGB(255, 84, 78, 78),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          margin: EdgeInsets.only(left: 20, right: 20,top: 10),
          padding: EdgeInsets.only(left: 17, right: 17),
           child:TextFormField(
             cursorColor:Colors.grey,

                   focusNode: null,
                     textInputAction: TextInputAction.next,                          
                     decoration: InputDecoration(
                       icon:  Icon(
                Icons.search,
                      color: Color.fromARGB(255, 226, 219, 219),
                      size: 30,  ),
                         hintText: "Search",
                       
                         hintStyle: TextStyle( 
                           color:  Color.fromARGB(255, 226, 219, 219),
                         ),
                       
                        ),
                         ),
        
        )




























          //           MyOutlinedButton( onPressed: () {},
          //   gradient: LinearGradient(colors: [Colors.indigo, Colors.pink]),
          //   child: Text('OutlinedButton'),
          // )
          ),
    );
  }
}
