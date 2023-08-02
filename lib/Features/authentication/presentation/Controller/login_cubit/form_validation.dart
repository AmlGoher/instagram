// // import 'package:formz/formz.dart';

// // enum EmailValidationError { invalid }

// // class Email extends FormzInput<String, EmailValidationError> {
// //   const Email.pure() : super.pure('');
// //   const Email.dirty([String value = '']) : super.dirty(value);

// // static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

// //   @override
// //   EmailValidationError? validator(String? value) {
// //     return _emailRegex.hasMatch(value ?? '') ? null : EmailValidationError.invalid;
// //   }
// // }

// // enum PasswordValidationError { invalid }

// // class Password extends FormzInput<String, PasswordValidationError> {
// //   const Password.pure() : super.pure('');
// //   const Password.dirty([String value = '']) : super.dirty(value);

// //   @override
// //   PasswordValidationError? validator(String? value) {
// //     return value != null && value.length >= 6 ? null : PasswordValidationError.invalid;
// //   }
// // }

// // class LoginForm {
// //   const LoginForm({
// //     this.email = const Email.pure(),
// //     this.password = const Password.pure(),
// //   });

// //   final Email email;
// //   final Password password;

// //   LoginForm copyWith({
// //     Email? email,
// //     Password? password,
// //   }) {
// //     return LoginForm(
// //       email: email ?? this.email,
// //       password: password ?? this.password,
// //     );
// //   }
// // }
// import 'package:formz/formz.dart';

// enum EmailValidationError { invalid }

// class Email extends FormzInput<String, EmailValidationError> {
//   const Email.pure() : super.pure('');
//   const Email.dirty([String value = '']) : super.dirty(value);

//   static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

//   @override
//   EmailValidationError? validator(String? value) {
//     return _emailRegex.hasMatch(value ?? '') ? null : EmailValidationError.invalid;
//   }
// }

// enum PasswordValidationError { invalid }

// class Password extends FormzInput<String, PasswordValidationError> {
//   const Password.pure() : super.pure('');
//   const Password.dirty([String value = '']) : super.dirty(value);

//   @override
//   PasswordValidationError? validator(String? value) {
//     return value != null && value.length >= 6 ? null : PasswordValidationError.invalid;
//   }
// }

// enum ConfirmedPasswordValidationError {
//   invalid,
//   mismatch,
// }

// class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordValidationError> {
//   final String password;

//   const ConfirmedPassword.pure({
//     this.password = ''
//   }) : super.pure('');

//   const ConfirmedPassword.dirty({
//     required this.password,
//     String value = ''
//   }) : super.dirty(value);

//   @override
//   ConfirmedPasswordValidationError? validator(String value) {
//     if (value.isEmpty) {
//       return ConfirmedPasswordValidationError.invalid;
//     }
//     return password == value
//         ? null
//         : ConfirmedPasswordValidationError.mismatch;
//   }
// }

// extension Explanation on ConfirmedPasswordValidationError {
//   String? get name {
//     switch(this) {
//       case ConfirmedPasswordValidationError.mismatch:
//         return 'passwords must match';
//       default:
//         return null;
//     }
//   }
// }