// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:instagram/Features/authentication/domain/repository/domain_repository.dart';
import 'package:instagram/core/errors/faliure.dart';
import 'package:instagram/core/usecases/base_usecase.dart';


class LoginWithFacebookUsecase extends BaseUseCase<Unit, NoParameters> {
      final  BaseRepository baseRepository;
      LoginWithFacebookUsecase(this.baseRepository);
  @override
  Future<Either<Failure, Unit>> call(NoParameters user)async {
    return await baseRepository.loginWithFacebook();
  }
}
