// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:instagram/Features/authentication/domain/repository/domain_repository.dart';
import 'package:instagram/core/errors/faliure.dart';
import 'package:instagram/core/usecases/base_usecase.dart';

import '../entities/user.dart';


class LoginWithEmailAndPasswordUsecase extends BaseUseCase<Unit, User> {
      final  BaseRepository baseRepository;
      LoginWithEmailAndPasswordUsecase(this.baseRepository);
  @override
  Future<Either<Failure, Unit>> call(User user)async {
    return await baseRepository.loginWithEmailandPassword(user);
  }
}
