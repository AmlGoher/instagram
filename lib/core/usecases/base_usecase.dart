import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:instagram/core/errors/faliure.dart';

abstract class BaseUseCase<T, User> {
  Future<Either<Failure, T>> call(User user);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}
