// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/constants/route_constants.dart';
import 'package:instagram/shared/sharedProfileAvatar.dart';
import 'package:instagram/shared/status_avatar.dart';

import '../Features/authentication/presentation/Controller/bloc/auth_bloc.dart';
import '../core/colors/constatnt_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class Avatarstatus {
  late String imgpath;
  Avatarstatus({required this.imgpath});
}

class Postnewpost {
  late String imgpostPath;
  late String imgprofilepath;
  late String puplishername;
  late bool isSponserdpost;
  Postnewpost({
    required this.imgpostPath,
    required this.imgprofilepath,
    required this.isSponserdpost,
    required this.puplishername,
  });
}

class _HomeState extends State<Home> {
  List Status = [
    Avatarstatus(imgpath: "assets/images/user1.jfif"),
    Avatarstatus(imgpath: "assets/images/user2.jfif"),
    Avatarstatus(imgpath: "assets/images/user3.jfif"),
    Avatarstatus(imgpath: "assets/images/user4.jfif"),
    Avatarstatus(imgpath: "assets/images/user5.jfif"),
    Avatarstatus(imgpath: "assets/images/user1.jfif"),
    Avatarstatus(imgpath: "assets/images/user2.jfif"),
    Avatarstatus(imgpath: "assets/images/user3.jfif"),
    Avatarstatus(imgpath: "assets/images/user4.jfif"),
    Avatarstatus(imgpath: "assets/images/user5.jfif"),
    Avatarstatus(imgpath: "assets/images/user1.jfif"),
    Avatarstatus(imgpath: "assets/images/user2.jfif"),
    Avatarstatus(imgpath: "assets/images/user3.jfif"),
    Avatarstatus(imgpath: "assets/images/user4.jfif"),
    Avatarstatus(imgpath: "assets/images/user5.jfif"),
  ];
  List posts = [
    Postnewpost(
        imgpostPath: "assets/images/post7.jfif",
        imgprofilepath: "assets/images/user1.jfif",
        isSponserdpost: true,
        puplishername: "MohmedKordy"),
    Postnewpost(
        imgpostPath: "assets/images/post2.jfif",
        imgprofilepath: "assets/images/post9.jfif",
        isSponserdpost: false,
        puplishername: 'AmlGoher'),
    Postnewpost(
        imgpostPath: "assets/images/post3.jfif",
        imgprofilepath: "assets/images/user3.jfif",
        isSponserdpost: true,
        puplishername: "Deina Saaed"),
    Postnewpost(
        imgpostPath: "assets/images/post4.jfif",
        imgprofilepath: "assets/images/post4.jfif",
        isSponserdpost: false,
        puplishername: 'Ahmed Ramy'),
    Postnewpost(
        imgpostPath: "assets/images/post1.jfif",
        imgprofilepath: "assets/images/user5.jfif",
        isSponserdpost: true,
        puplishername: "Fady Alaa"),
    Postnewpost(
        imgpostPath: "assets/images/post6.jfif",
        imgprofilepath: "assets/images/user1.jfif",
        isSponserdpost: false,
        puplishername: 'Layan Mohmed'),
    Postnewpost(
        imgpostPath: "assets/images/post7.jfif",
        imgprofilepath: "assets/images/user2.jfif",
        isSponserdpost: true,
        puplishername: "Merna khalil"),
    Postnewpost(
        imgpostPath: "assets/images/post8.jfif",
        imgprofilepath: "assets/images/user3.jfif",
        isSponserdpost: false,
        puplishername: 'Mark Zakerburg'),
    Postnewpost(
        imgpostPath: "assets/images/post9.jfif",
        imgprofilepath: "assets/images/user4.jfif",
        isSponserdpost: true,
        puplishername: "Mina Masaod"),
    Postnewpost(
        imgpostPath: "assets/images/post10.jfif",
        imgprofilepath: "assets/images/user5.jfif",
        isSponserdpost: false,
        puplishername: 'FIFI hnaa'),
  ];

  @override
  Widget build(BuildContext context) {
    final Object? passedemail = ModalRoute.of(context)!.settings.arguments;
    final double widthScreen = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SucceededAuthState) {
          Navigator.pushReplacementNamed(
           context,RoutesConstants.kHomeScreen   );
        }
      },
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 255, 255),
          ));
        }
        return Scaffold(
          backgroundColor:
              widthScreen > 600 ? ConstantColors.webBackgroundColor : ConstantColors.mobileBackgroundColor,
          appBar: widthScreen > 600
              ? null
              : AppBar(
                  backgroundColor: ConstantColors.mobileBackgroundColor,
                  title: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/instagram.svg",
                        color: ConstantColors.kWhiteColor,
                        height: 35,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: ConstantColors.kWhiteColor,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  alignment: Alignment(-0.90, -0.88),
                                  contentPadding: EdgeInsets.all(8),
                                  clipBehavior: Clip.antiAlias,
                                  backgroundColor: ConstantColors.webBackgroundColor,
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'Follow',
                                            style:
                                                TextStyle(color: ConstantColors.kWhiteColor),
                                          ),
                                          Icon(
                                            Icons.people_alt_outlined,
                                            color: ConstantColors.kWhiteColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        BlocProvider.of<AuthBloc>(context)
                                            .add(LogOutEvent());
      Navigator.pushReplacementNamed(context,RoutesConstants.kLoginScreen);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text(
                                            'LogOut',
                                            style:
                                                TextStyle(color: ConstantColors.kWhiteColor),
                                          ),
                                          Icon(
                                            Icons.logout_outlined,
                                            color: ConstantColors.kWhiteColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      )
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                            },
                            icon: const Icon(
                              Icons.add_box_outlined,
                              color: ConstantColors.kWhiteColor,
                            )),
                        SizedBox(
                          width: 8,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: ConstantColors.kWhiteColor,
                            )),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesConstants.kChatHomeScreen,
                                arguments: passedemail);
                          },
                          child: SvgPicture.asset(
                            "assets/images/icons8-facebook-messenger.svg",
                            color: ConstantColors.kWhiteColor
                            ,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    )
                  ],
                ),
          body: Container(
            margin: widthScreen > 600
                ? EdgeInsets.symmetric(vertical: 11, horizontal: 290)
                : null,
            decoration: widthScreen > 600
                ? BoxDecoration(
                    color: ConstantColors.mobileBackgroundColor,
                    borderRadius: BorderRadius.circular(12))
                : null,
            child: RefreshIndicator(
              color: ConstantColors.kWhiteColor,
              backgroundColor: ConstantColors.kGreyColor,
              onRefresh: () async {},
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Stack(children: [
                              Positioned(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    height: 80,
                                    //                       decoration: BoxDecoration(
                                    // gradient: LinearGradient(
                                    //     colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
                                    // shape: BoxShape.circle),

                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          6), //width of the border

                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ConstantColors.kGreyColor,
                                          shape: BoxShape.circle,
                                        ), // this height forces the container to be a circle
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Image.asset(
                                            "assets/images/avatar.png",
                                            color: ConstantColors.kWhiteColor
                                            ,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 57,
                                top: 47,
                                child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: ConstantColors.mobileBackgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.lightBlue,
                                    )),
                              )
                            ]),
                            ...Status.map((item) =>
                                StatusClass(imgpathvar: item.imgpath)).toList(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ...posts
                          .map((item) => PostWidget(
                                isSponserd: item.isSponserdpost,
                                postimage: item.imgpostPath,
                                profileimage: item.imgprofilepath,
                                puplishername: item.puplishername,
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
