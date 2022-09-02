import 'package:clean_architecture_beer_app/core/presentation/components/beer_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/beer.dart';
import '../../../utils/constants/routes.dart';

class BeerList extends StatelessWidget {
  const BeerList({Key? key, required this.beerList}) : super(key: key);

  final List<Beer> beerList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: beerList.length,
      itemBuilder: (context, int index) {
        Beer beer = beerList.elementAt(index);
        return BeerTile(beer: beer);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }
}
