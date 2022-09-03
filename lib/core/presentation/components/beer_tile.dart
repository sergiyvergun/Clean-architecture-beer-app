import 'package:clean_architecture_beer_app/core/presentation/components/favourite_button.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:clean_architecture_beer_app/presentation/blocs/favourite_beers_cubit/favourite_beers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/beer.dart';
import '../../../utils/constants/routes.dart';

class BeerTile extends StatelessWidget {
  const BeerTile({Key? key, required this.beer}) : super(key: key);
  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.beerDetails, extra: beer);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Image.network(
              beer.imageUrl,
              height: 200,
              width: 150,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ABV: ${beer.abv}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            BlocBuilder<FavouriteBeersCubit, FavouriteBeersState>(
              builder: (context, state) {
                return FavouriteButton(
                    selected: state.beerList.map((e) => e.id).contains(beer.id),
                    onPressed: () async {
                      if (state is FavouriteBeersRequestSucceed &&
                          state.beerList.map((e) => e.id).contains(beer.id)) {
                        await context
                            .read<FavouriteBeersCubit>()
                            .removeFavouriteBeer(beer);
                      } else {
                        await context
                            .read<FavouriteBeersCubit>()
                            .favouriteBeer(beer);
                      }
                      await context
                          .read<FavouriteBeersCubit>()
                          .getFavouriteBeers();
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
