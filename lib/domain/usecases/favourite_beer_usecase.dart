import '../../core/usecases/usecase.dart';
import '../entities/beer.dart';
import '../repositories/beers_repository.dart';

class FavouriteBeerUseCase implements UseCase<void, Beer> {
  FavouriteBeerUseCase(this._beersRepository);

  final BeersRepository _beersRepository;

  @override
  Future<void> call({required Beer params}) {
    return _beersRepository.favouriteBeer(params);
  }
}