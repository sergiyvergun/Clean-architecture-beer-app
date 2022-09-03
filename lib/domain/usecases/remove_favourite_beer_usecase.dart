import '../../core/usecases/usecase.dart';
import '../entities/beer.dart';
import '../repositories/beers_repository.dart';

class RemoveFavouriteBeerUseCase implements UseCase<void, Beer> {
  RemoveFavouriteBeerUseCase(this._beersRepository);

  final BeersRepository _beersRepository;

  @override
  Future<void> call({required Beer params}) {
    return _beersRepository.removeFavouriteBeer(params);
  }
}