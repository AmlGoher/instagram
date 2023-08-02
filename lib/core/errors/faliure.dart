import 'package:equatable/equatable.dart';

import 'errors_Model/error_strings.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoSavedUserFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WeakPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmailAlreadyInUseFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongPasswordFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class FaceBookLogInFailure extends Failure {
  @override
  List<Object?> get props => [];
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return ErrorsStrings.serverFailureMessage;
    case OfflineFailure:
      return ErrorsStrings.offlineFailureMessage;
    case NoSavedUserFailure:
      return ErrorsStrings.noSavedUserFailureeMessage;
    case WeakPasswordFailure:
      return ErrorsStrings.weakPasswordFailureMessage;
    case EmailAlreadyInUseFailure:
      return ErrorsStrings.emailAlreadyInUseFailureMessage;
    case UserNotFoundFailure:
      return ErrorsStrings.userNotFoundFailureMessage;
    case WrongPasswordFailure:
      return ErrorsStrings.wrongPasswordFailureMessage;
    case FaceBookLogInFailure:
      return ErrorsStrings.faceBookLogInFailureMessage;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
