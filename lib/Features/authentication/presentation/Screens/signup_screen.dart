// ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:instagram/Features/authentication/domain/entities/user.dart';
import 'package:instagram/shared/Colors.dart';
import 'package:instagram/shared/sharedTextFeild.dart';

import '../../../../shared/snakebar.dart';
import '../Controller/bloc/auth_bloc.dart';

class Signup extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isPasswordVisible = false;
  // late String email, username, fullname, password;

  Signup({super.key});
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double hightScreen = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          const CircularProgressIndicator(
            color: Colors.white,
          );
        } else if (state is SucceededAuthState) {
          Navigator.pushReplacementNamed(
            context,
            "login",
          );
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
                            height: 582,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(
                                    color: const Color.fromARGB(83, 70, 70, 70),
                                    width: 0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/instagram.svg"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Text(
                                        "Sign up to see photos and videos from your friends.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.facebook,
                                        color:
                                            Color.fromARGB(255, 252, 252, 252),
                                        size: 24.0,
                                      ),
                                      label: const Text(
                                        "Log in with Facebook",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        //  backgroundColor: MaterialStateProperty.all(Colors.orange),
                                        overlayColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 54, 77, 202)),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 11)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Row(
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // SharedTextFormFeild(

                                    //   onchange: (data) {
                                    //     email = data;
                                    //   },
                                    //   inputdata: TextInputType.emailAddress,
                                    //   isObscure: false,
                                    //   lableName: 'Email',
                                    //   badding: 8, isEmailFeild: true,
                                    // ),
                                    SharedTextFormFeild(
                                      border: const OutlineInputBorder(),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      isPasswordField: false,
                                      text: 'Email',
                                      hint: 'example@gmail.com',
                                      focusNode: _emailFocusNode,
                                      onChange: (value) {
                                        // email = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email Can\'t be Empty';
                                        } else if (!value!
                                                .toString()
                                                .contains('@') ||
                                            value!.length < 12 ||
                                            value!.length > 35) {
                                          return 'Invalid Email';
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    // SharedTextFormFeild(
                                    //   onchange: (data) {
                                    //     fullname = data;
                                    //   },
                                    //   inputdata: TextInputType.emailAddress,
                                    //   isObscure: false,
                                    //   lableName: 'FullName',
                                    //   badding: 8,
                                    // ),
                                    SharedTextFormFeild(
                                      border: const OutlineInputBorder(),
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      isPasswordField: false,
                                      text: 'FullName',
                                      hint: 'Example',
                                      onChange: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'FullName Can\'t be Empty';
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SharedTextFormFeild(
                                      keyboardType: TextInputType.emailAddress,
                                      border: const OutlineInputBorder(),
                                      isPasswordField: false,
                                      controller: _userNameController,
                                      text: 'Name',
                                      hint: 'Example',
                                      onChange: (value) {},
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name Can\'t be Empty';
                                        }
                                      },
                                    ),
                                    // SharedTextFormFeild(
                                    //   onchange: (data) {
                                    //     username = data;
                                    //   },
                                    //   inputdata: TextInputType.emailAddress,
                                    //   isObscure: false,
                                    //   lableName: 'Username',
                                    //   badding: 8,
                                    // ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    BlocConsumer<AuthBloc, AuthState>(
                                      listener: (context, state) {
                                        if (state is ShowPasswordState) {
                                          isPasswordVisible =
                                              state.isPasswordVisible;
                                        } else if (state is HidePasswordState) {
                                          isPasswordVisible =
                                              state.isPasswordVisible;
                                        }
                                      },
                                      builder: (context, state) {
                                        return SharedTextFormFeild(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          border: const OutlineInputBorder(),

                                          onChange: (value) {},
                                          controller: _passwordController,
                                          toggelPasswordFunction: () {
                                            BlocProvider.of<AuthBloc>(context).add(
                                                ToggelPasswordVisibilityEvent());
                                          },
                                          isPasswordVisible: isPasswordVisible,
                                          isPasswordField: true,
                                          focusNode: _passwordFocusNode,
                                          text: 'Password',
                                          hint: '* * * * * * ',
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Password Can\'t be Empty';
                                            }
                                          },
                                          //  onchange: (data) {
                                          //                       password = data;
                                          //                     },
                                          //                     badding: 2,
                                          //                     lableName: " Password",
                                          //                     inputdata: TextInputType.visiblePassword,
                                          //                     isObscure: true,
                                          //                     isPasswordFeild: true,
                                        );
                                      },
                                    ),

                                    // SharedTextFormFeild(
                                    //   onchange: (data) {
                                    //     password = data;
                                    //   },
                                    //   badding: 2,
                                    //   lableName: " Password",
                                    //   inputdata: TextInputType.visiblePassword,
                                    //   isObscure: true,
                                    //   isPasswordFeild: true,

                                    // ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    Center(
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          text:
                                              "People who use our service may have uploaded your contact information to Instagram. ",
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Learn More',
                                                style: const TextStyle(
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
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Terms ',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            const TextSpan(
                                              text: ',',
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                                text: ' Privacy Policy',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                            const TextSpan(
                                              text: 'and',
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(
                                                text: ' Cookies Policy .',
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        204, 1, 39, 70)),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {}),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 11,
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState!.validate()) {
                                          _formkey.currentState?.save();
                                          final user = User(
                                              id: _emailController.text,
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text);

                                          BlocProvider.of<AuthBloc>(context)
                                              .add(SignUpEvent(user: user));
                                        }
                                      },
                                      style: ButtonStyle(
                                        //  backgroundColor: MaterialStateProperty.all(Colors.orange),
                                        overlayColor: MaterialStateProperty.all(
                                            const Color.fromARGB(
                                                255, 54, 77, 202)),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(
                                                horizontal: 100, vertical: 16)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                      child: const Text(
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
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(1),
                              border: Border.all(
                                  color: const Color.fromARGB(83, 70, 70, 70),
                                  width: 0.5)),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Have an account?",
                                style: const TextStyle(
                                  color: mobileBackgroundColor,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Log in',
                                      style: const TextStyle(
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


// GlobalKey<FormState> formkey = GlobalKey();
//..................................
//

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../Cubits/chat_test/cubit/authentication_cubit.dart';

// class RegisterLoginScreen extends StatefulWidget {
//   @override
//   _RegisterLoginScreenState createState() => _RegisterLoginScreenState();
// }

// class _RegisterLoginScreenState extends State<RegisterLoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Chat App'),
//         ),
//         body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
//             listener: (context, state) {
//           if (state is AuthenticationLoading) {
//             CircularProgressIndicator(
//               color: Colors.white,
//             );
//           } else if (state is AuthenticationSuccess) {
//             Navigator.pushReplacementNamed(context, "chat_bubble_page");
//           } else if (state is AuthenticationFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("something not signup"),
//             ));
//           }
//         }, builder: (context, state) {
//           return Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<AuthenticationCubit>().signIn(
//                           email: _emailController.text.trim(),
//                           password: _passwordController.text.trim(),
//                         );
//                   },
//                   child: Text('Sign In'),
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.read<AuthenticationCubit>().signUp(
//                           email: _emailController.text.trim(),
//                           password: _passwordController.text.trim(),
//                         );
//                   },
//                   child: Text('Register'),
//                 ),
//                 SizedBox(height: 16.0),
//                 state is AuthenticationLoading
//                     ? CircularProgressIndicator()
//                     : Container(),
//               ],
//             ),
//           );
//         }));
//   }
// }
