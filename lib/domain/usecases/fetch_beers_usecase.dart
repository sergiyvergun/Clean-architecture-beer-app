import '../../../../core/params/beer_list_request_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/beer.dart';
import '../repositories/beers_repository.dart';

class FetchBeersUseCase
    implements UseCase<DataState<List<Beer>>, BeerListRequestParams> {
  final BeersRepository _beersRepository;

  FetchBeersUseCase(this._beersRepository);

  @override
  Future<DataState<List<Beer>>> call(
      {required BeerListRequestParams params}) async {
    return await _beersRepository.fetchBeers(params);
  }
}
