import 'package:dartz/dartz.dart';
import '../../../../core/errors/faliure.dart';
import '../entities/user.dart';

abstract class BaseRepository {
  Future<Either<Failure, Unit>> loginWithEmailandPassword(User user);
  Future<Either<Failure, Unit>> loginWithFacebook();
  Future<Either<Failure, Unit>> signup(User user);
  Future<Either<Failure, Unit>> logout();
    bool goToHomeViewOrLoginView();

}
