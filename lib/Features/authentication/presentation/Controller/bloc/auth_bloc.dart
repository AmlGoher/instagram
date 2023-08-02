import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:instagram/Features/authentication/domain/usecases/go_to_Home_veiw_or_Login_veiw.dart';
import 'package:instagram/Features/authentication/domain/usecases/login_with_email_password_usecase.dart';
import 'package:instagram/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_with_facebook_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/signup_with_email_password_usecase.dart';
import '../login_cubit/form_validation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  final SignUpWithEmailAndPasswordUsecase signUpWithEmailAndPasswordUsecase;
  final LoginWithFacebookUsecase loginWithFacebookUsecase;
  final GoToHomeViewOrLoginViewUseCase goToHomeViewOrLoginViewUseCase;
  final LogoutUsecase logoutUsecase;
  bool isPasswordVisible = false;
  bool isLoggedIn = false;

  AuthBloc(
    this.loginWithEmailAndPasswordUsecase,
    this.signUpWithEmailAndPasswordUsecase,
    this.loginWithFacebookUsecase,
    this.goToHomeViewOrLoginViewUseCase,
    this.logoutUsecase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      print("state is $event");
      if (event is GoToHomeViewOrLogInViewEvent) {
        emit(LoadingAuthState());
        isLoggedIn = goToHomeViewOrLoginViewUseCase.call();
        print(isLoggedIn);
        if (isLoggedIn) {
          emit(LoggedInState());
        } else {
          emit(NotLoggedInState());
        }
      } else if (event is EmailAndPasswordLogInEvent) {
        emit(LoadingAuthState());
        final Either<Failure, Unit> failureOrSuccess =
            await loginWithEmailAndPasswordUsecase.call(event.user);

        failureOrSuccess.fold(
          (failure) =>
              emit(ErrorAuthState(message: mapFailureToMessage(failure))),
          (success) => emit(SucceededAuthState()),
        );
      } else if (event is FacebookLogInEvent) {
        emit(LoadingAuthState());
        final Either<Failure, Unit> failureOrSuccess =
            await loginWithFacebookUsecase.call(const NoParameters());

        failureOrSuccess.fold(
          (failure) =>
              emit(ErrorAuthState(message: mapFailureToMessage(failure))),
          (success) => emit(SucceededAuthState()),
        );
      } else if (event is SignUpEvent) {
        emit(LoadingAuthState());
        final Either<Failure, Unit> failureOrSuccess =
            (await signUpWithEmailAndPasswordUsecase.call(event.user));

        failureOrSuccess.fold(
          (failure) =>
              emit(ErrorAuthState(message: mapFailureToMessage(failure))),
          (success) => emit(SucceededAuthState()),
        );
      } else if (event is LogOutEvent) {
        emit(LoadingAuthState());
        final Either<Failure, Unit> failureOrSuccess =
            (await logoutUsecase.call(const NoParameters()));
        failureOrSuccess.fold(
          (failure) =>
              emit(ErrorAuthState(message: mapFailureToMessage(failure))),
          (success) => emit(SucceededAuthState()),
        );
      } else if (event is ToggelPasswordVisibilityEvent) {
        if (!isPasswordVisible) {
          isPasswordVisible = true;
          emit(HidePasswordState(isPasswordVisible: isPasswordVisible));
        } else {
          isPasswordVisible = false;
          emit(ShowPasswordState(isPasswordVisible: isPasswordVisible));
        }
      }
    });
  }
}
