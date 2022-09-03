import 'package:clean_architecture_beer_app/core/usecases/usecase.dart';
import 'package:clean_architecture_beer_app/domain/repositories/beers_repository.dart';

import '../entities/beer.dart';

class GetFavouriteBeersUseCase implements UseCase<List<Beer>, void> {
  GetFavouriteBeersUseCase(this._beersRepository);

  final BeersRepository _beersRepository;

  @override
  Future<List<Beer>> call({void params}) {
    return _beersRepository.getFavouriteBeers();
  }
}
