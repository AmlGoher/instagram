// part of 'login_cubit.dart';

// @immutable
// abstract class LoginState {}

// class LoginInitial extends LoginState {}

// class LoginFormSubmitted  extends LoginState {}

// class PasswordChanged   extends LoginState {
//    PasswordChanged(this.password);

//   final String password;}

// class EmailChanged   extends LoginState {
//    EmailChanged(this.email);

//   final String email;
// }
//...........................................
// part of 'login_cubit.dart';


//  class LoginState extends Equatable {
//   const LoginState({
//     this.email = const Email.pure(),
//     this.password = const Password.pure(),
//     this.status = FormzStatus.pure,
//     this.errorMessage,
//   });

//   final Email email;
//   final Password password;
//   final FormzStatus status;
//   final String? errorMessage;
//   @override
//   List<Object> get props => [email, password, status];

//   LoginState copyWith({
//     Email? email,
//     Password? password,
//     required FormzStatus status,
//     String? errorMessage,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       status: status,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }


//}
 