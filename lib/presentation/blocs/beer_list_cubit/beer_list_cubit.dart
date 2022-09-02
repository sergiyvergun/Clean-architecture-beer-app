import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../../../core/params/beer_list_request_params.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/beer.dart';
import '../../../domain/usecases/fetch_beers_usecase.dart';

part 'beer_list_state.dart';

class BeerListCubit extends Cubit<BeerListState> {
  BeerListCubit(this._fetchBeersUseCase) : super(BeerListInitial());
  final FetchBeersUseCase _fetchBeersUseCase;

  Future fetchBeerList() async {
    emit(BeerListRequested());
    final dataState = await _fetchBeersUseCase(params: BeerListRequestParams());

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final beerList = dataState.data;
      emit(BeerListRequestSucceed(beerList: beerList!));
    }
    if (dataState is DataFailure) {
      emit(BeerListRequestFailed(error: dataState.error!));
    }
  }
}
