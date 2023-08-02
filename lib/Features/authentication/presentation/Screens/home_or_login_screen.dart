import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Features/authentication/presentation/Screens/login_screen.dart';
import 'package:instagram/Screens/Home.dart';

import '../Controller/bloc/auth_bloc.dart';

class HomeViewOrAuthView extends StatelessWidget {
  const HomeViewOrAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingAuthState) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 100, 187, 34),
          ));
        } else if (state is LoggedInState) {

          // Schedule navigation to occur after the widget tree has finished building
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Home(),
            ));
          });
        } else if (state is NotLoggedInState) {
          // Schedule navigation to occur after the widget tree has finished building
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          });
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Color.fromARGB(255, 199, 57, 57),
        ));
      },
    );
  }
}
