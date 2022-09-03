import 'package:bloc/bloc.dart';
import 'package:clean_architecture_beer_app/domain/usecases/favourite_beer_usecase.dart';
import 'package:clean_architecture_beer_app/domain/usecases/get_favourite_beers_usecase.dart';
import 'package:clean_architecture_beer_app/domain/usecases/remove_favourite_beer_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/beer.dart';

part 'favourite_beers_state.dart';

class FavouriteBeersCubit extends Cubit<FavouriteBeersState> {
  FavouriteBeersCubit(
    this._favouriteBeerUseCase,
    this._getFavouriteBeersUseCase,
    this._removeFavouriteBeerUseCase,
  ) : super(const FavouriteBeersInitial(beerList: []));

  final FavouriteBeerUseCase _favouriteBeerUseCase;
  final GetFavouriteBeersUseCase _getFavouriteBeersUseCase;
  final RemoveFavouriteBeerUseCase _removeFavouriteBeerUseCase;

  List<Beer> favouriteBeers = [];

  getFavouriteBeers() async {
    emit(FavouriteBeersRequested(beerList: favouriteBeers));
    try {
      favouriteBeers = await _getFavouriteBeersUseCase();
      emit(FavouriteBeersRequestSucceed(beerList: favouriteBeers));
    } catch (e) {
      emit(FavouriteBeersRequestFailed(beerList: favouriteBeers));
      rethrow;
    }
  }

  favouriteBeer(Beer beer) async {
    await _favouriteBeerUseCase(params: beer);
  }

  removeFavouriteBeer(Beer beer) async {
    await _removeFavouriteBeerUseCase(params: beer);
  }
}
