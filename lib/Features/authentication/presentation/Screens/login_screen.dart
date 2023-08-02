// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/Cubits/chat_bubble_screen_Cubit/cubit/chat_bubble_screen_cubit.dart';
import 'package:instagram/Features/authentication/presentation/Screens/signup_screen.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/sharedTextFeild.dart';

import '../../../../shared/snakebar.dart';
import '../../domain/entities/user.dart';
import '../Controller/bloc/auth_bloc.dart';
import 'login_form_feild.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey();
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // late FocusNode _emailFocusNode;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
   bool isPasswordVisible=false ;
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          const CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (state is SucceededAuthState) {
          // to get All old message once open the App
          BlocProvider.of<ChatBubbleScreenCubit>(context).receiveMessage();
          Navigator.pushReplacementNamed(context, "HomeViewOrAuthView", arguments: _emailController.text);
        } else if (state is ErrorAuthState) {
          SnackBarMessage()
              .showErrorSnackBar(message: state.message, context: context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: _formkey,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 248, 248, 248),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Card(
                          child: Container(
                            width: 350,
                            height: 465,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(
                                    color: const Color.fromARGB(83, 70, 70, 70),
                                    width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: Center(
                                child: Column(children: [
                                  SvgPicture.asset(
                                      "assets/images/instagram.svg"),
                                  
                                const SizedBox(
                                    height: 26,
                                  ),
                        //  Loginformfeild(),
                         SharedTextFormFeild(
        border: const OutlineInputBorder(),
        keyboardType: TextInputType.emailAddress,
        controller: _emailController,
        isPasswordField: false,
        text: 'Email',
        hint: '   example@gmail.com',
        focusNode: _emailFocusNode,
        onChange: (value) {
          // email = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email Can\'t be Empty';
          } else if (!value!.toString().contains('@') ||
              value!.length < 12 ||
              value!.length > 35) {
            return 'Invalid Email';
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is ShowPasswordState) {
            isPasswordVisible = state.isPasswordVisible;
          } else if (state is HidePasswordState) {
            isPasswordVisible = state.isPasswordVisible;
          }
        },
        builder: (context, state) {
          return SharedTextFormFeild(
            border: const OutlineInputBorder(),
            keyboardType: TextInputType.visiblePassword,
            onChange: (value) {},
            controller: _passwordController,
            toggelPasswordFunction: () {
              BlocProvider.of<AuthBloc>(context)
                  .add(ToggelPasswordVisibilityEvent());
              print(isPasswordVisible);
            },
            isPasswordVisible: isPasswordVisible,
            isPasswordField: true,
            focusNode: _passwordFocusNode,
            text: 'Password',
            hint: 'Password ',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password Can\'t be Empty';
              }
            },
          );
        },
      ),
      const SizedBox(
        height: 25,
      ),
      ElevatedButton(
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState?.save();

            final user = User(
                id: _emailController.text,
                email: _emailController.text,
                password: _passwordController.text);

            BlocProvider.of<AuthBloc>(context)
                .add(EmailAndPasswordLogInEvent(user: user));
          }
        },
        style: ButtonStyle(
          //  backgroundColor: MaterialStateProperty.all(Colors.orange),
          overlayColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 54, 77, 202)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 90, vertical: 15)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        child: const Text(
          "Log in",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),

                             const Row(
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
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.facebook,
                                            color:
                                                Color.fromARGB(204, 1, 39, 70),
                                            size: 24.0,
                                          ),
                                          onPressed: () {
                                            BlocProvider.of<AuthBloc>(context)
                                                .add(FacebookLogInEvent());
                                          },
                                        ),
                                        const Text(
                                          "Log in with Facebook",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  204, 1, 39, 70)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      ' Forget Password?',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(204, 1, 39, 70)),
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
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                  color: const Color.fromARGB(83, 70, 70, 70),
                                  width: 0.5)),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Don't have an account?",
                                style: const TextStyle(
                                  color: mobileBackgroundColor,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Sign up',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(204, 9, 137, 241)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(
                                              context, 'signup');
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
