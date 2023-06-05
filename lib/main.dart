import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';
import 'package:instagram/Responsive/Responsive.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Screens/Login.dart';
import 'package:instagram/Screens/chat_bubble_screen.dart';
import 'package:instagram/Screens/chat_home_screen.dart';
import 'package:instagram/Screens/signup.dart';
import 'Cubits/login_cubit/login_cubit.dart';
import 'Cubits/signup_cubit/cubit/signup_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => ChatBubbleScreenCubit(),
        ),
      ],
    
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'instagram',
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(color: Colors.white,));} 
        else if (snapshot.hasError) {return SnackBar( content:Text("Something went wrong"),);}
        else if (snapshot.hasData) {return Responsive();}
        else { return Login();}
      },
       ),
        routes: {
            // When navigating to the "/" route, build the FirstScreen widget.
           //'/': (context) => +const Responsive(),
          // When navigating to the "/second" route, build the SecondScreen widget.
         'Home': (context) =>  Home(),
          'login': (context) =>  Login(),
      
          'signup': (context) =>  Signup(),
          "chat_home_screen": (context) =>  chat_home_screen(),
          "chat_bubble_page": (context) =>  Chat_bubble_page()
        },
        //  Responsive(),
      ),
    );
  }
}
