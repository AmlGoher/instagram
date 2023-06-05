// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram/Screens/MainMobileDesign.dart';
import 'package:instagram/shared/Colors.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final List<Widget> tabs = <Widget>[
    Icon(
      Icons.grid_on_sharp,
      color: primaryColor,
      size: 24.0,
    ),
    Icon(Icons.movie_rounded, color: primaryColor, size: 24.0),
    Icon(
      Icons.person_pin_outlined,
      color: primaryColor,
      size: 24.0,
    )
  ];

  @override
  Widget build(BuildContext context) {
        final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
  backgroundColor:
          widthScreen > 600 ? webBackgroundColor : mobileBackgroundColor,
        //           appBar: AppBar(
        //   backgroundColor: mobileBackgroundColor,
        //   title: Text(
        //     "    Aml Gohar",
        //     style: TextStyle(fontSize: 24),
        //   ),
        // ),
        body: Container(
          margin:  widthScreen > 600
            ? EdgeInsets.symmetric(vertical: 11, horizontal: 290)
            : null,
             decoration: widthScreen > 600
            ? BoxDecoration(
                color: mobileBackgroundColor,
                borderRadius: BorderRadius.circular(12))
            : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: DefaultTabController(
                    length: tabs.length, // This is the number of tabs.
                    child: Scaffold(
                      body: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          // These are the slivers that show up in the "outer" scroll view.
                          return <Widget>[
                            SliverOverlapAbsorber(
                              handle:
                                  NestedScrollView.sliverOverlapAbsorberHandleFor(
                                      context),
                              sliver: SliverAppBar(
                                backgroundColor: mobileBackgroundColor,
                                flexibleSpace: Column(
                                  children: [
                                    Row(
                                    mainAxisAlignment:MainAxisAlignment.center ,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Stack(children: [
                                            Positioned(
                                              child: Container(
                                                padding: EdgeInsets.all(2),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: secondaryColor,
                                                ),
                                               
                                               
                                               
                                               
                                               
                                               
                                               
                                                child: CircleAvatar(
                                                  radius: 55,
                                                  backgroundImage: AssetImage(
                                                      "assets/images/post5.jfif"),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 87,
                                              top: 82,
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.add_circle,
                                                    color: Colors.lightBlue,
                                                    size: 26,
                                                  )),
                                            )
                                          ]),
                                        ),

                                        // ignore: prefer_const_literals_to_create_immutables
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "1",
                                                    style: TextStyle(fontSize: 22),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Posts",
                                                    style: TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 22,
                                              ),
                                              // ignore: prefer_const_literals_to_create_immutables
                                              Column(
                                                children: [
                                                  Text(
                                                    "15",
                                                    style: TextStyle(fontSize: 22),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Followers",
                                                    style: TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 22,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    "221",
                                                    style: TextStyle(fontSize: 22),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Following",
                                                    style: TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(left: 35),
                                        child: Text(
                                          "Cute & Lovely",
                                          style: TextStyle(fontSize: 15),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.edit,
                                              color: primaryColor,
                                              size: 24.0,
                                            ),
                                            label: Text(
                                              "Edit Post",
                                              style: TextStyle(fontSize: 19),
                                            ),
                                            style: ButtonStyle(
                                              fixedSize: MaterialStatePropertyAll(
                                                  Size(260, 54)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      mobileBackgroundColor),
                                              padding: MaterialStateProperty.all(
                                                  EdgeInsets.all(12)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(8),
                                                      side: BorderSide(
                                                          color: primaryColor))),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.exit_to_app,
                                              color: primaryColor,
                                              size: 24.0,
                                            ),
                                            label: Text(
                                              "Log Out",
                                              style: TextStyle(fontSize: 19),
                                            ),
                                            style: ButtonStyle(
                                              fixedSize: MaterialStatePropertyAll(
                                                  Size(260, 54)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color.fromARGB(
                                                          255, 118, 38, 32)),
                                              padding: MaterialStateProperty.all(
                                                  EdgeInsets.all(12)),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(8),
                                                      side: BorderSide(
                                                          color: primaryColor))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      thickness: 0.5,
                                      indent: 0,
                                      color: secondaryColor,
                                    ),
                                  ],
                                ),
                                pinned: true,
                                expandedHeight: 300.0,
                                forceElevated: innerBoxIsScrolled,
                                bottom: TabBar(
                                  // These are the widgets to put in each tab in the tab bar.
                                  tabs: tabs
                                      .map((Widget name) => Tab(
                                            icon: name,
                                          ))
                                      .toList(),
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
                              child: Container(
                                color: mobileBackgroundColor,
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
                                          handle: NestedScrollView
                                              .sliverOverlapAbsorberHandleFor(
                                                  context),
                                        ),
                                        SliverPadding(
                                            padding: const EdgeInsets.all(8.0),
                                            // In this example, the inner scroll view has
                                            // fixed-height list items, hence the use of
                                            // SliverFixedExtentList. However, one could use any
                                            // sliver widget here, e.g. SliverList or SliverGrid.
                                            sliver: SliverGrid(
                                              gridDelegate:
                                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200.0,
                                                mainAxisSpacing: 1.0,
                                                crossAxisSpacing: 1.0,
                                                childAspectRatio: 3 / 3,
                                              ),
                                              delegate: SliverChildBuilderDelegate(
                                                (BuildContext context, index) {
                                                  return Image.asset(
                                                      "assets/images/post2.jfif");
                                                },
                                                childCount:9,
                                              ),
                                            )),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  //      GridView.builder(
                  //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount:3,
                  //   childAspectRatio: 3 / 3,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10),
                  //  itemCount: 8,
                  //  itemBuilder: (BuildContext context, int index) {
                  //     return ClipRRect(
                  //       borderRadius: BorderRadius.circular(8),child: Image.asset( "assets/images/post2.jfif"));
                  //  }),
                )
              ],
            ),
          ),
        ));
  }
}
