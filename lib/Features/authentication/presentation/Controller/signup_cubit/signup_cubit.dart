// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:instagram/Features/authentication/presentation/Screens/signup_screen.dart';
// import 'package:meta/meta.dart';

// part 'signup_state.dart';

// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit() : super(SignupInitial());
//   // Define fields to store the email and password values
//   String email = '';
//   String password = '';
//   bool isEmailValid = false;
//   bool isPasswordValid = false;
//   //  _getAuthState() {
//   //   // Return a new state with the updated isEmailValid and isPasswordValid values
//   //   return AuthState(
//   //     isEmailValid: isEmailValid,
//   //     isPasswordValid: isPasswordValid,
//   //   );
//   // }

 
// //  bool isValidEmail(String value) {
// //     // Add your email validation logic here
// //     return value.isNotEmpty && value.contains('@');

// //   }
// //   // Define methods to update the email and password fields
// //   void setEmail(String value) {
// //     email = value;
// //     // Validate the email field and update the isEmailValid field
// //     isEmailValid = isValidEmail(value);
// //     // Emit a new state to update the UI with the updated isEmailValid value
// //     emit(_getAuthState());
// //   }
// // bool isValidPassword(String value) {
// //     // Add your password validation logic here
// //     return value.isNotEmpty && value.length >= 6;
// //   }

// //   void setPassword(String value) {
// //     password = value;
// //     // Validate the password field and update the isPasswordValid field
// //     isPasswordValid = isValidPassword(value);
// //     // Emit a new state to update the UI with the updated isPasswordValid value
// //     emit(_getAuthState());
// //   }  

// //   // Define a private method to get the current authentication state
 
 

  
//   Future<void> signupUser(
//       {required String email, required String password}) async {
//     emit(SignupLoading());
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         // SnackBar(content: Text('No user found for that email.'),);
//         emit(SignupFailuer(errMessage: 'user-not-found'));
//       } else if (e.code == 'wrong-password') {
//         // SnackBar(content: Text('Wrong password.'),);
//         emit(SignupFailuer(errMessage: 'wrong-password'));
//       }
//     } catch (e) {
//       emit(SignupFailuer(errMessage: 'something went wrong . $e'));
//     }
//   }
// }
