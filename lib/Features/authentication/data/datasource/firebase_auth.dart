import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:instagram/Features/authentication/data/model/user_model.dart';
import '../../../../core/constants/auth_Constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class BaseFirebaseAuthData {
  Future<UserCredential> loginWithEmailandPassword(UserModel userModel);
  Future<UserCredential> signup(UserModel userModel);
  Future<Unit> setUserData(UserModel userModel);
  Future<UserCredential> loginWithFacebook();
  Future<Unit> logout();
  Future<UserModel> getUserData();
  
}

class FirebaseAuthData extends BaseFirebaseAuthData {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  FirebaseAuthData({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  Future<UserCredential> loginWithEmailandPassword(UserModel userModel) async {
    try {
      final credential = _firebaseAuth.signInWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException();
      }
    } catch (e) {
      throw ServerException();
    }
    throw ServerException();
  }

  @override
  Future<UserCredential> loginWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.accessToken != null) {
        // Exchange the Facebook access token for a Firebase credential
        AuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Sign in to Firebase with the Facebook credential
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        return userCredential;
      } else {
        throw FaceBookLogInException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> logout() async {
    try {
      // Sign out the current user using FirebaseAuth
      await FirebaseAuth.instance.signOut();

      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserCredential> signup(UserModel userModel) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      }
    } catch (e) {
      throw ServerException();
    }
    throw ServerException();
  }

  @override
  Future<UserModel> getUserData() async {
    try {
      // Get the current user ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get the user document from Firestore using the current user ID
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore
          .collection(AuthConstants.kUsersCollection)
          .doc(userId)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Convert the document data to a User object
        UserModel userModel = UserModel(
          userName: documentSnapshot.data()![AuthConstants.kUserName],
          email: documentSnapshot.data()![AuthConstants.kEmail],
          id: documentSnapshot.data()![AuthConstants.kId],
        );
        return userModel;
      } else {
        throw NoSavedUserException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> setUserData(UserModel userModel) async {
    try {
      // Get the current user ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Convert AuthModel object to a map using toJson() method
      Map<String, dynamic> authData = userModel.toJson();

      // Access the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Set the authData map to a document with the current user ID in a 'users' collection
      await firestore
          .collection(AuthConstants.kUsersCollection)
          .doc(userId)
          .set({
        AuthConstants.kUserName: authData[AuthConstants.kUserName],
        AuthConstants.kEmail: authData[AuthConstants.kEmail],
        AuthConstants.kId: authData[AuthConstants.kId],
        AuthConstants.kPassword: authData[AuthConstants.kPassword],
      });

      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }
}
