
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';
import 'package:instagram/Features/authentication/presentation/Controller/login_cubit/login_cubit.dart';
import 'package:instagram/Features/authentication/presentation/Screens/login_form_feild.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Features/authentication/presentation/Screens/login_screen.dart';
import 'package:instagram/Screens/chat_bubble_screen.dart';
import 'package:instagram/Screens/chat_home_screen.dart';
import 'package:instagram/Features/authentication/presentation/Screens/signup_screen.dart';
import 'package:instagram/core/services/service_locator.dart' as di;
import 'Features/authentication/presentation/Controller/bloc/auth_bloc.dart';
import 'Features/authentication/presentation/Screens/home_or_login_screen.dart';
import 'Screens/splash/splash_body.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await di.servicesLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => di.sl<AuthBloc>(),

        ),
        // BlocProvider<LoginCubit>(
        //   create: (context) => di.sl<LoginCubit>(),
        // ),
        BlocProvider(
          create: (context) => ChatBubbleScreenCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'instagram',
        home: SplashScreen(),
        
        // StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //           child: CircularProgressIndicator(
        //         color: Colors.white,
        //       ));
        //     } else if (snapshot.hasError) {
        //       return const SnackBar(
        //         content: Text("Something went wrong"),
        //       );
        //     } else if (snapshot.hasData) {
        //       return LoginScreen();
        //     } else {
        //       return Signup();
        //     }
        //   },
        //),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          //'/': (context) => +const Responsive(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          'Home': (context) => const Home(),
          "HomeViewOrAuthView":(context)=>const HomeViewOrAuthView(),
          'login': (context) => LoginScreen(),
          'signup': (context) => Signup(),
          "chat_home_screen": (context) => const ChatHomeScreen(),
          "chat_bubble_page": (context) => const ChatBubblePage()
        },
        //  Responsive(),
      ),
    );
  }
}
