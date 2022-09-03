import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/params/beer_list_request_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/beer.dart';
import '../../domain/repositories/beers_repository.dart';
import '../datasources/local/beers_dao.dart';
import '../datasources/remote/beers_api_service.dart';

class BeersRepositoryImpl implements BeersRepository {
  final BeersApiService _beersApiService;
  final BeersDao beersDao;

  BeersRepositoryImpl(this._beersApiService, this.beersDao);

  @override
  Future<DataState<List<Beer>>> fetchBeers(BeerListRequestParams params) async {
    try {
      final httpResponse = await _beersApiService.fetchBeerList();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailure(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<void> favouriteBeer(Beer beer) {
    return beersDao.insertBeer(beer);
  }

  @override
  Future<List<Beer>> getFavouriteBeers() async {
    return beersDao.getAllBeers();
  }

  @override
  Future<void> removeFavouriteBeer(Beer beer) {
    return beersDao.deleteBeer(beer);
  }
}
