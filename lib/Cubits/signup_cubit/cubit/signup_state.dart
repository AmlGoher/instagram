// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSucsess extends SignupState {}

class SignupFailuer extends SignupState {
  String errMessage;
  SignupFailuer({
    required this.errMessage,
  });
}
