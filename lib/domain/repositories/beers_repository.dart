import 'package:clean_architecture_beer_app/core/params/beer_list_request_params.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/beer.dart';

abstract class BeersRepository{
  Future<DataState<List<Beer>>> fetchBeers(BeerListRequestParams params);

  Future<List<Beer>> getFavouriteBeers();

  Future<void> favouriteBeer(Beer beer);

  Future<void> removeFavouriteBeer(Beer beer);
}