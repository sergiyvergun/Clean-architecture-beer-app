import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/beer_list/presentation/screens/beer_list_screen.dart';
import 'utils/constants/routes.dart';

void main() {
  runApp(BeerApp());
}

class BeerApp extends StatelessWidget {
  BeerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          )),
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
