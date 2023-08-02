// import 'package:flutter/material.dart';
// import 'package:instagram/Features/authentication/presentation/Controller/bloc/auth_bloc.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:instagram/Features/authentication/presentation/Screens/signup_screen.dart';
// import 'package:instagram/shared/sharedTextFeild.dart';

// import '../../domain/entities/user.dart';

// class Loginformfeild extends StatelessWidget {
//   Loginformfeild({super.key});
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   // late FocusNode _emailFocusNode;
//   final FocusNode _emailFocusNode = FocusNode();
//   final FocusNode _passwordFocusNode = FocusNode();
//    bool isPasswordVisible=false ;
//   final GlobalKey<FormState> _formkey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       SharedTextFormFeild(
//         border: const OutlineInputBorder(),
//         keyboardType: TextInputType.emailAddress,
//         controller: _emailController,
//         isPasswordField: false,
//         text: 'Email',
//         hint: '   example@gmail.com',
//         focusNode: _emailFocusNode,
//         onChange: (value) {
//           email = value;
//         },
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Email Can\'t be Empty';
//           } else if (!value!.toString().contains('@') ||
//               value!.length < 12 ||
//               value!.length > 35) {
//             return 'Invalid Email';
//           }
//         },
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           print(state);
//           if (state is ShowPasswordState) {
//             isPasswordVisible = state.isPasswordVisible;
//           } else if (state is HidePasswordState) {
//             isPasswordVisible = state.isPasswordVisible;
//           }
//         },
//         builder: (context, state) {
//           return SharedTextFormFeild(
//             border: const OutlineInputBorder(),
//             keyboardType: TextInputType.visiblePassword,
//             onChange: (value) {},
//             controller: _passwordController,
//             toggelPasswordFunction: () {
//               BlocProvider.of<AuthBloc>(context)
//                   .add(ToggelPasswordVisibilityEvent());
//               print(isPasswordVisible);
//             },
//             isPasswordVisible: isPasswordVisible,
//             isPasswordField: true,
//             focusNode: _passwordFocusNode,
//             text: 'Password',
//             hint: 'Password ',
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Password Can\'t be Empty';
//               }
//             },
//           );
//         },
//       ),
//       const SizedBox(
//         height: 25,
//       ),
//       ElevatedButton(
//         onPressed: () async {
//           if (_formkey.currentState!.validate()) {
//             _formkey.currentState?.save();

//             final user = User(
//                 id: _emailController.text,
//                 email: _emailController.text,
//                 password: _passwordController.text);

//             BlocProvider.of<AuthBloc>(context)
//                 .add(EmailAndPasswordLogInEvent(user: user));
//           }
//         },
//         style: ButtonStyle(
//           //  backgroundColor: MaterialStateProperty.all(Colors.orange),
//           overlayColor:
//               MaterialStateProperty.all(const Color.fromARGB(255, 54, 77, 202)),
//           padding: MaterialStateProperty.all(
//               const EdgeInsets.symmetric(horizontal: 90, vertical: 15)),
//           shape: MaterialStateProperty.all(
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//         ),
//         child: const Text(
//           "Log in",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 25,
//       ),
//     ]);
//   }
// }
