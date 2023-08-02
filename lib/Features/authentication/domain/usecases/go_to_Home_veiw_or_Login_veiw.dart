import '../repository/domain_repository.dart';

class GoToHomeViewOrLoginViewUseCase {
  final  BaseRepository baseRepository;
      GoToHomeViewOrLoginViewUseCase(this.baseRepository);
  bool call() {
    return baseRepository.goToHomeViewOrLoginView();
  }
}