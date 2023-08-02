import 'package:dartz/dartz.dart';
import 'package:instagram/Features/authentication/domain/repository/domain_repository.dart';
import 'package:instagram/core/errors/faliure.dart';
import 'package:instagram/core/usecases/base_usecase.dart';

class LogoutUsecase extends BaseUseCase<Unit, NoParameters> {
      final  BaseRepository baseRepository;
      LogoutUsecase(this.baseRepository);
  @override
  Future<Either<Failure, Unit>> call(NoParameters user)async {
    return await baseRepository.logout();
  }
}