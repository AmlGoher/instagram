// import 'package:instagram/core/errors/faliure.dart';
// import 'errors_Model/error_message_model.dart';

// class ServerException implements Exception {
//   final ErrorMessageModel errorMessageModel;

//   const ServerException({
//     required this.errorMessageModel,
//   });
// }

// // coverage:ignore-file

// class LogInWithEmailAndPasswordException extends Failure implements Exception {
//   const LogInWithEmailAndPasswordException(super.message,
//       {this.defulMessage = 'An unknown exception occurred.'});
//   final String defulMessage;
//   factory LogInWithEmailAndPasswordException.fromCode(String code) {
//     switch (code) {
//       case 'invalid-email':
//         return const LogInWithEmailAndPasswordException(
//           'Email is not valid or badly formatted.',
//         );
//       case 'user-disabled':
//         return const LogInWithEmailAndPasswordException(
//           'This user has been disabled. Please contact support for help.',
//         );
//       case 'user-not-found':
//         return const LogInWithEmailAndPasswordException(
//           'Email is not found, please create an account.',
//         );
//       case 'wrong-password':
//         return const LogInWithEmailAndPasswordException(
//           'Incorrect password, please try again.',
//         );
//       default:
//         return const LogInWithEmailAndPasswordException('An unknown exception occurred.');
//     }
//   }
// }
class ServerException implements Exception {}

class OfflineException implements Exception {}

class NoSavedUserException implements Exception {}

class WeakPasswordException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

class FaceBookLogInException implements Exception {}