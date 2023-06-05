// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/Cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:instagram/Screens/Home.dart';
import 'package:instagram/Screens/Login.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/sharedTextFeild.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hightScreen = MediaQuery.of(context).size.height;
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
       
          if (state is SignupLoading) {
            CircularProgressIndicator(
              color: Colors.white,
            );
          } else if (state is SignupSucsess) {
            
            Navigator.pushReplacementNamed(
              context,
              "login",
            );
          } else if (state is SignupFailuer) {
            SnackBar(content: Text(state.errMessage));
          }
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: formkey,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 248, 248, 248),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          child: Container(
                            width: 350,
                            height: 580,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(
                                    color: Color.fromARGB(83, 70, 70, 70),
                                    width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/instagram.svg"),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "Sign up to see photos and videos from your friends.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.facebook,
                                        color:
                                            Color.fromARGB(255, 252, 252, 252),
                                        size: 24.0,
                                      ),
                                      label: Text(
                                        "Log in with Facebook",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        //  backgroundColor: MaterialStateProperty.all(Colors.orange),
                                        overlayColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 54, 77, 202)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 11)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            thickness: 1,
                                            indent: 15,
                                            endIndent: 10,
                                            color:
                                                Color.fromARGB(36, 78, 76, 76),
                                          ),
                                        ),
                                        Text("OR",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  124, 22, 22, 22),
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Expanded(
                                          child: Divider(
                                            thickness: 1,
                                            indent: 15,
                                            endIndent: 10,
                                            color:
                                                Color.fromARGB(36, 78, 76, 76),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SharedTextFormFeild(
                                      Onchange: (data) {
                                        email = data;
                                        print(data);
                                      },
                                      inputdata: TextInputType.emailAddress,
                                      isObscure: false,
                                      lableName: 'Email',
                                      badding: 8,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SharedTextFormFeild(
                                      Onchange: (data) {
                                        fullname = data;
                                      },
                                      inputdata: TextInputType.emailAddress,
                                      isObscure: false,
                                      lableName: 'FullName',
                                      badding: 8,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SharedTextFormFeild(
                                      Onchange: (data) {
                                        username = data;
                                      },
                                      inputdata: TextInputType.emailAddress,
                                      isObscure: false,
                                      lableName: 'Username',
                                      badding: 8,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SharedTextFormFeild(
                                      Onchange: (data) {
                                        password = data;
                                        print(data);
                                      },
                                      badding: 2,
                                      lableName: " Password",
                                      inputdata: TextInputType.visiblePassword,
                                      isObscure: true,
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text:
                                              "People who use our service may have uploaded your contact information to Instagram. ",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Learn More',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text:
                                              "By signing up, you agree to our ",
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Terms ',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            TextSpan(
                                              text: ',',
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                                text: ' Privacy Policy',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            TextSpan(
                                              text: 'and',
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                                text: ' Cookies Policy .',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 11,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (formkey.currentState!.validate()) {
                                          BlocProvider.of<SignupCubit>(context)
                                              .signupUser(
                                                  email: email,
                                                  password: password);
                                        }
                                      },
                                      style: ButtonStyle(
                                        //  backgroundColor: MaterialStateProperty.all(Colors.orange),
                                        overlayColor: MaterialStateProperty.all(
                                            Color.fromARGB(255, 54, 77, 202)),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                horizontal: 100, vertical: 16)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: 350,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                  color: Color.fromARGB(83, 70, 70, 70),
                                  width: 0.5)),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Have an account?",
                                style: TextStyle(
                                  color: mobileBackgroundColor,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Log in',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(204, 9, 137, 241)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(
                                              context, "login");
                                        }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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

late String email, username, fullname, password;
GlobalKey<FormState> formkey = GlobalKey();
