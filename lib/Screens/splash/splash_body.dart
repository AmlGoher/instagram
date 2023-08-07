import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Features/authentication/presentation/Screens/home_or_login_screen.dart';
import 'package:instagram/Screens/splash/splash_veiw.dart';
import 'package:instagram/core/constants/route_constants.dart';

import '../../Features/authentication/presentation/Controller/bloc/auth_bloc.dart';
import '../../Features/authentication/presentation/Screens/login_screen.dart';
import '../../core/constants/auth_Constants.dart';
import '../Home.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  bool isUserLoggedIn = false;

  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  void homeOrLogin(BuildContext context) {
    BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 100, 187, 34),
          ));
        } else if (state is LoggedInState) {
          // Schedule navigation to occur after the widget tree has finished building
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacementNamed(context,RoutesConstants.kHomeScreen);
          });
        } else if (state is NotLoggedInState) {
          // Schedule navigation to occur after the widget tree has finished building
          Future.delayed(Duration.zero, () {
             Navigator.pushReplacementNamed(context,RoutesConstants.kLoginScreen);
          });
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Color.fromARGB(255, 199, 57, 57),
        ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AuthBloc>(context).add(GoToHomeViewOrLogInViewEvent());
    homeOrLogin(context);
    // Create animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Create logo animation from top to center
    _logoAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Create text animation from bottom to center
    _textAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation
    _controller.forward();
    Timer(const Duration(seconds: AuthConstants.kSplashScreenDurationInSecond),
        () {
        Navigator.pushReplacementNamed(context,RoutesConstants.kHomeScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SplashViewWBody(
          width: width,
          height: height,
          logoAnimation: _logoAnimation,
          textAnimation: _textAnimation),
    );
  }
}
