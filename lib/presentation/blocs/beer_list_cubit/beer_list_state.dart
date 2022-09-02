part of 'beer_list_cubit.dart';

@immutable
abstract class BeerListState {}

class BeerListInitial extends BeerListState {}

class BeerListRequested extends BeerListState {}

class BeerListRequestSucceed extends BeerListState {
  final List<Beer> beerList;

  BeerListRequestSucceed({required this.beerList});
}

class BeerListRequestFailed extends BeerListState {
  final DioError error;

  BeerListRequestFailed({required this.error});
}
