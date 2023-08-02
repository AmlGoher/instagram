part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class EmailAndPasswordLogInEvent extends AuthEvent {
  final User user;

  const EmailAndPasswordLogInEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class FacebookLogInEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  final User user;

  const SignUpEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class ToggelPasswordVisibilityEvent extends AuthEvent {}

class GoToHomeViewOrLogInViewEvent extends AuthEvent {}

// class LoginEmailChanged extends AuthEvent {
//   const LoginEmailChanged({required this.email});

//   final String email;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LoginEmailChanged &&
//           runtimeType == other.runtimeType &&
//           email == other.email;

//   @override
//   int get hashCode => email.hashCode;
// }

// class LoginPasswordChanged extends AuthEvent {
//   const LoginPasswordChanged({required this.password});

//   final String password;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LoginPasswordChanged &&
//           runtimeType == other.runtimeType &&
//           password == other.password;

//   @override
//   int get hashCode => password.hashCode;
// }

// class LoginSubmitted extends AuthEvent {
//   const LoginSubmitted();
// }
