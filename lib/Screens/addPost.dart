
import 'package:flutter/material.dart';

import '../core/colors/constatnt_color.dart';

// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title:Text("Add New Post"),
        
//     ));
//   }}
 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: AddPostScreen(),
    );
  }
}

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  List<Widget > tabs =  <Widget >[const Icon(Icons.edit, color:ConstantColors.kWhiteColor, size: 24.0, ),
    const Icon(Icons.edit, color:ConstantColors.kWhiteColor, size: 24.0),const Icon(Icons.favorite, color:ConstantColors.kWhiteColor, size: 24.0, ) ];
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle:  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
             
                  pinned: true,
                  expandedHeight: 20.0,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: tabs.map((Widget  name) => Tab(icon: name,)).toList(),
                  ),
                ),
              ),
            ];
          },









          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((Widget name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is
                  // "inside" the NestedScrollView, so that
                  // sliverOverlapAbsorberHandleFor() can find the
                  // NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<Widget>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber
                          // above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          // In this example, the inner scroll view has
                          // fixed-height list items, hence the use of
                          // SliverFixedExtentList. However, one could use any
                          // sliver widget here, e.g. SliverList or SliverGrid.
                          sliver:SliverGrid(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                   crossAxisSpacing: 10.0,
                   childAspectRatio: 3/3,
                                     ),
                        delegate: SliverChildBuilderDelegate(
                         (BuildContext context, index) {
                       return  ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset( "assets/images/post2.jfif"));
 }
    ,
    childCount: 8,
  ),
)
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
