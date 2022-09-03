import 'package:clean_architecture_beer_app/presentation/blocs/beer_list_cubit/beer_list_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/screens/beer_details_screen.dart';
import 'package:clean_architecture_beer_app/presentation/screens/beer_list_screen.dart';
import 'package:clean_architecture_beer_app/presentation/screens/favourites_screen.dart';
import 'package:clean_architecture_beer_app/service_locator.dart';
import 'package:clean_architecture_beer_app/utils/constants/hive_boxes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import 'domain/entities/beer.dart';
import 'utils/constants/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await initHive();
  runApp(BeerApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  var favouriteBeersBox = await Hive.openBox(kFavouriteBeersBox);
}

class BeerApp extends StatelessWidget {
  BeerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BeerListCubit>(
          create: (context) => GetIt.I()..fetchBeerList(),
        ),
        BlocProvider<FavouriteBeersCubit>(
            create: (context) => GetIt.I()..getFavouriteBeers()),
      ],
      child: MaterialApp.router(
        title: 'Beer App',
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            dividerColor: Colors.grey[400],
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) =>
            const BeerListScreen(),
      ),
      GoRoute(
        path: Routes.beerDetails,
        builder: (context, state) =>
            BeerDetailsScreen(beer: state.extra as Beer),
      ),
      GoRoute(
        path: Routes.favourites,
        builder: (BuildContext context, GoRouterState state) =>
            const FavouritesScreen(),
      ),
    ],
  );
}
