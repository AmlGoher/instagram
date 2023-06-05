import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSucsess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // SnackBar(content: Text('No user found for that email.'),);
        emit(LoginFaliuer(errMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        // SnackBar(content: Text('Wrong password.'),);
                emit(LoginFaliuer(errMessage: 'wrong-password'));

      }
    } catch (e) {
      emit(LoginFaliuer(errMessage: "Something went wrong "));
    }
  }
}
