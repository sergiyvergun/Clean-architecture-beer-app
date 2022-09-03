import 'package:clean_architecture_beer_app/core/presentation/components/beer_list.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        leading: const BackButton(),
      ),
      body: BlocBuilder<FavouriteBeersCubit, FavouriteBeersState>(
        builder: (context, state) {
          return BeerList(beerList: state.beerList);
        },
      ),
    );
  }
}
