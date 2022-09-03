part of 'favourite_beers_cubit.dart';

@immutable
abstract class FavouriteBeersState {
  final List<Beer> beerList;

  const FavouriteBeersState({required this.beerList});
}

class FavouriteBeersInitial extends FavouriteBeersState {
  const FavouriteBeersInitial({required super.beerList});
}

class FavouriteBeersRequested extends FavouriteBeersState {
  const FavouriteBeersRequested({required super.beerList});
}

class FavouriteBeersRequestSucceed extends FavouriteBeersState {
  const FavouriteBeersRequestSucceed({required super.beerList});
}

class FavouriteBeersRequestFailed extends FavouriteBeersState {
  const FavouriteBeersRequestFailed({required super.beerList});
}
