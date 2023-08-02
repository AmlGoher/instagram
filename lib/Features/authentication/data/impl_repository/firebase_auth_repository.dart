// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:instagram/Features/authentication/data/datasource/firebase_auth.dart';
import 'package:instagram/Features/authentication/data/model/user_model.dart';
import 'package:instagram/Features/authentication/domain/repository/domain_repository.dart';
import 'package:instagram/core/errors/faliure.dart';
import 'package:instagram/core/network/internet_cheker.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user.dart';
import '../datasource/local_auth.dart';

class FirebaseAuthDataRepository extends BaseRepository {
  final BaseFirebaseAuthData baseFirebaseAuthData;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkConnectionChecker networkConnectionChecker;

  FirebaseAuthDataRepository(
    this.baseFirebaseAuthData,
    this.authLocalDataSource,
    this.networkConnectionChecker,
  );
  @override
  Future<Either<Failure, Unit>> loginWithEmailandPassword(User user) async {
    if (await networkConnectionChecker.isConnected) {
      try {
        UserModel userModel = UserModel(
          id: user.id,
          userName: user.userName ?? '',
          email: user.email,
          password: user.password ?? '',
        );
        await baseFirebaseAuthData.loginWithEmailandPassword(userModel);

        await baseFirebaseAuthData.setUserData(userModel);
        await authLocalDataSource.setUserData(userModel);
        await authLocalDataSource.setIsUserLoggedIn(isUserLoggedIn: true);
        return const Right(unit);
      } on UserNotFoundException {
        return left(UserNotFoundFailure());
      } on WrongPasswordException {
        return Left(WrongPasswordFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signup(User user) async {
    if (await networkConnectionChecker.isConnected) {
      try {
        UserModel authModel = UserModel(
          id: user.id,
          userName: user.userName ?? '',
          email: user.email,
          password: user.password ?? '',
        );

        await baseFirebaseAuthData.signup(authModel);
        await baseFirebaseAuthData.setUserData(authModel);
        await authLocalDataSource.setUserData(authModel);
        await authLocalDataSource.setIsUserLoggedIn(isUserLoggedIn: true);

        return const Right(unit);
      } on WeakPasswordException {
        return Left(WeakPasswordFailure());
      } on EmailAlreadyInUseException {
        return Left(EmailAlreadyInUseFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  bool goToHomeViewOrLoginView() {
    bool isUserLoggedIn = authLocalDataSource.getIsUserLoggedIn() ?? false;
    return isUserLoggedIn;
  }

  @override
  Future<Either<Failure, Unit>> loginWithFacebook() async {
    if (await networkConnectionChecker.isConnected) {
      try {
        firebase_auth.UserCredential userCredential =
            await baseFirebaseAuthData.loginWithFacebook();
        UserModel authModel = UserModel(
            userName: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email!,
            id: userCredential.user!.uid,
            password: '');
        await baseFirebaseAuthData.setUserData(authModel);
        await authLocalDataSource.setUserData(authModel);
        await authLocalDataSource.setIsUserLoggedIn(isUserLoggedIn: true);

        return const Right(unit);
      } on FaceBookLogInException {
        return Left(FaceBookLogInFailure());
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        return Left(OfflineFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    if (await networkConnectionChecker.isConnected) {
      try {
        await authLocalDataSource.clearUserData();
        await authLocalDataSource.setIsUserLoggedIn(isUserLoggedIn: false);
        await baseFirebaseAuthData.logout();

        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
