import 'package:get_it/get_it.dart';
import 'package:instagram/Features/authentication/data/datasource/firebase_auth.dart';
import 'package:instagram/Features/authentication/domain/usecases/go_to_Home_veiw_or_Login_veiw.dart';
import 'package:instagram/Features/authentication/domain/usecases/login_with_email_password_usecase.dart';
import 'package:instagram/Features/authentication/domain/usecases/login_with_facebook_usecase.dart';
import 'package:instagram/Features/authentication/domain/usecases/logout_usecase.dart';
import 'package:instagram/Features/authentication/domain/usecases/signup_with_email_password_usecase.dart';
import 'package:instagram/Features/authentication/presentation/Controller/login_cubit/login_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/authentication/data/datasource/local_auth.dart';
import '../../Features/authentication/data/impl_repository/firebase_auth_repository.dart';
import '../../Features/authentication/domain/repository/domain_repository.dart';
import '../../Features/authentication/presentation/Controller/bloc/auth_bloc.dart';
import '../network/internet_cheker.dart';

final sl = GetIt.instance;

Future<void> servicesLocator() async {
  //! Features - Auth

  // Bloc

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  // sl.registerFactory<LoginCubit>(() => LoginCubit( sl(), sl()));
  // UseCases
  sl.registerLazySingleton(() => GoToHomeViewOrLoginViewUseCase(sl()));
  sl.registerLazySingleton(() => SignUpWithEmailAndPasswordUsecase(sl()));
  sl.registerLazySingleton(() => LoginWithEmailAndPasswordUsecase(sl()));
  sl.registerLazySingleton(() => LoginWithFacebookUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));

  // Repositories
  sl.registerLazySingleton<BaseRepository>(
    () => FirebaseAuthDataRepository(
      sl(),
      sl(),
      sl(),
    ),
  );

  // DataSources

  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceSharedPrefes(sl()));
  sl.registerLazySingleton<BaseFirebaseAuthData>(() => FirebaseAuthData());
  //! Core
  sl.registerLazySingleton<NetworkConnectionChecker>(
      () => NetworkConnectionCheckerImpl(sl()));
sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  //! External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
