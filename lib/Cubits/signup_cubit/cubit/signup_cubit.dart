import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/Screens/signup.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Future<void> signupUser(
      {required String email, required String password}) async {
    emit(SignupLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // SnackBar(content: Text('No user found for that email.'),);
        emit(SignupFailuer(errMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        // SnackBar(content: Text('Wrong password.'),);
        emit(SignupFailuer(errMessage: 'wrong-password'));
      }
    } catch (e) {
      emit(SignupFailuer(errMessage: 'something went wrong . $e'));
    }
  }
}
