part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsess extends LoginState {}

class LoginFaliuer extends LoginState {
  String errMessage;
  LoginFaliuer({required this.errMessage});
}
