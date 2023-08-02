// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';


// // part 'login_state.dart';

// // class LoginCubit extends Cubit<LoginState> {
// //   LoginCubit() : super(LoginInitial());

// //   Future<void> loginUser(
// //       {required String email, required String password}) async {
// //     emit(LoginLoading());
// //     try {
// //       await FirebaseAuth.instance.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       emit(LoginSucsess());
// //     } on FirebaseAuthException catch (e) {
// //       if (e.code == 'user-not-found') {
// //         // SnackBar(content: Text('No user found for that email.'),);
// //         emit(LoginFaliuer(errMessage: 'user-not-found'));
// //       } else if (e.code == 'wrong-password') {
// //         // SnackBar(content: Text('Wrong password.'),);
// //                 emit(LoginFaliuer(errMessage: 'wrong-password'));

// //       }
// //     } catch (e) {
// //       emit(LoginFaliuer(errMessage: "Something went wrong "));
// //     }
// //   }
// // }
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import 'package:instagram/Features/authentication/domain/repository/domain_repository.dart';

// import '../../../domain/entities/user.dart';
// import 'form_validation.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit(this._baseRepository,this.user) : super(const LoginState());

//   final BaseRepository _baseRepository;
//   final User user;

//   void emailChanged(String value) {
//     final email = Email.dirty(value);
//     emit(
//       state.copyWith(
//         email: email,
//         status: Formz.validate([email, state.password]),
//       ),
//     );
//   }

//   void passwordChanged(String value) {
//     final password = Password.dirty(value);
//     emit(
//       state.copyWith(
//         password: password,
//         status: Formz.validate([state.email, password]),
//       ),
//     );
//   }

//   Future<void> logInWithCredentials() async {
//     if (!state.status.isValidated) return;
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));

//     final result = await _baseRepository.loginWithEmailandPassword(
//    user
//     );

//     result.fold(
//       (l) {
//         emit(
//           state.copyWith(
            
//             status: FormzStatus.submissionFailure,
//           ),
//         );
//       },
//       (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
//     );
//   }

//   Future<void> logInWithFacebook() async {
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));

//     final result = await _baseRepository.loginWithFacebook();

//     result.fold(
//       (l) {
//         emit(
//           state.copyWith(
      
//             status: FormzStatus.submissionFailure,
//           ),
//         );
//       },
//       (r) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
//     );
//   }
// }