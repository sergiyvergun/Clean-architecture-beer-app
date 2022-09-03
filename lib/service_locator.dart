import 'package:clean_architecture_beer_app/data/datasources/local/beers_dao.dart';
import 'package:clean_architecture_beer_app/domain/usecases/favourite_beer_usecase.dart';
import 'package:clean_architecture_beer_app/domain/usecases/get_favourite_beers_usecase.dart';
import 'package:clean_architecture_beer_app/domain/usecases/remove_favourite_beer_usecase.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/beer_list_cubit/beer_list_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/beers_api_service.dart';
import 'data/repositories/beers_repository_impl.dart';
import 'domain/repositories/beers_repository.dart';
import 'domain/usecases/fetch_beers_usecase.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<Dio>(Dio());

  serviceLocator.registerSingleton(BeersApiService(serviceLocator()));
  serviceLocator.registerSingleton(BeersDao());
  serviceLocator.registerSingleton<BeersRepository>(
      BeersRepositoryImpl(serviceLocator(), serviceLocator()));
  serviceLocator.registerSingleton<FetchBeersUseCase>(
      FetchBeersUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => BeerListCubit(serviceLocator()));

  serviceLocator.registerSingleton<FavouriteBeerUseCase>(
      FavouriteBeerUseCase(serviceLocator()));
  serviceLocator.registerSingleton<GetFavouriteBeersUseCase>(
      GetFavouriteBeersUseCase(serviceLocator()));
  serviceLocator.registerSingleton<RemoveFavouriteBeerUseCase>(
      RemoveFavouriteBeerUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => FavouriteBeersCubit(
      serviceLocator(), serviceLocator(), serviceLocator()));
}
