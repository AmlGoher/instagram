part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class SucceededAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  const ErrorAuthState({required this.message});
  @override
  List<Object> get props => [message];
}

class ShowPasswordState extends AuthState {
  final bool isPasswordVisible;
  const ShowPasswordState({required this.isPasswordVisible});
  @override
  List<Object> get props => [isPasswordVisible];
}
class HidePasswordState extends AuthState {
  final bool isPasswordVisible;
  const HidePasswordState({required this.isPasswordVisible});
  @override
  List<Object> get props => [isPasswordVisible];
}
class GoToHomeViewOrLogInViewState extends AuthState {}
class LoggedInState extends AuthState {}
class NotLoggedInState extends AuthState {}


// class LoginState extends AuthState {
//   const LoginState({
//     this.email = const Email.pure(),
//     this.password = const Password.pure(),
//     this.status = FormzStatus.pure,
//   });

//   final Email email;
//   final Password password;
//   final FormzStatus status;

//   LoginState copyWith({
//     Email? email,
//     Password? password,
//     FormzStatus? status,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       status: status ?? this.status,
//     );
//   }

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LoginState &&
//           runtimeType == other.runtimeType &&
//           email == other.email &&
//           password == other.password &&
//           status == other.status;

//   @override
//   int get hashCode => email.hashCode ^ password.hashCode ^ status.hashCode;
// }
