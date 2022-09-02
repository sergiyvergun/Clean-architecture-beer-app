import 'package:clean_architecture_beer_app/presentation/blocs/beer_list_cubit/beer_list_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/screens/beer_list_screen.dart';
import 'package:clean_architecture_beer_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'utils/constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(BeerApp());
}

class BeerApp extends StatelessWidget {
  BeerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BeerListCubit>(
      create: (context) => GetIt.I()..fetchBeerList(),
      child: MaterialApp.router(
        title: 'Beer App',
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        routeInformationProvider: _router.routeInformationProvider,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
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
    ],
  );
}
