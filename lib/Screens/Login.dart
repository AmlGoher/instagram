// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';
import 'package:instagram/Screens/signup.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/sharedTextFeild.dart';

import '../Cubits/login_cubit/login_cubit.dart';

class Login extends StatelessWidget {
  Login({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (state is LoginSucsess) {
          
          // to get All old message once open the App
          BlocProvider.of<ChatBubbleScreenCubit>(context).receiveMessage();
          Navigator.pushReplacementNamed(context, "Home", );
        } else if (state is LoginFaliuer) {
         
          // SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.errMessage)),
  );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: formkey,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 248, 248, 248),
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                        child: Container(
                          width: 350,
                          height: 450,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                  color: Color.fromARGB(83, 70, 70, 70),
                                  width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Center(
                              child: Column(children: [
                                SvgPicture.asset("assets/images/instagram.svg"),
                                SizedBox(
                                  height: 18,
                                ),
                                SharedTextFormFeild(
                                  Onchange: (data) {
                                    email = data;
                                  },
                                  inputdata: TextInputType.emailAddress,
                                  fontTextsize: 14,
                                  isObscure: false,
                                  lableName: 'Phone number,username,or email',
                                  badding: 8,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                SharedTextFormFeild(
                                  Onchange: (data) {
                                    password = data;
                                  },
                                  fontTextsize: 14,
                                  badding: 2,
                                  lableName: " Password",
                                  inputdata: TextInputType.visiblePassword,
                                  isObscure: true,
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (formkey.currentState!.validate()) {
                                      BlocProvider.of<LoginCubit>(context)
                                          .loginUser(
                                              email: email, password: password);
                                    }
                                  },
                                  style: ButtonStyle(
                                    //  backgroundColor: MaterialStateProperty.all(Colors.orange),
                                    overlayColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 54, 77, 202)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 110, vertical: 15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        indent: 15,
                                        endIndent: 10,
                                        color: Color.fromARGB(36, 78, 76, 76),
                                      ),
                                    ),
                                    Text("OR",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(124, 22, 22, 22),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        indent: 15,
                                        endIndent: 10,
                                        color: Color.fromARGB(36, 78, 76, 76),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.facebook,
                                        color: Color.fromARGB(204, 1, 39, 70),
                                        size: 24.0,
                                      ),
                                      Text(
                                        "Log in with Facebook",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(204, 1, 39, 70)),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    ' Forget Password?',
                                    style: TextStyle(
                                        color: Color.fromARGB(204, 1, 39, 70)),
                                  ),
                                  onPressed: () {},
                                ),
                              ]),
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
                              text: "Don't have an account?",
                              style: TextStyle(
                                color: mobileBackgroundColor,
                                fontSize: 15,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Sign up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(204, 9, 137, 241)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, 'signup');
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
        );
      },
    );
  }
}
