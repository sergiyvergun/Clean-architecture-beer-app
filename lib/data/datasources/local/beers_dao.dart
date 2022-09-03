import 'dart:convert';

import 'package:clean_architecture_beer_app/data/models/beer_model.dart';
import 'package:clean_architecture_beer_app/utils/constants/hive_boxes_names.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/entities/beer.dart';

class BeersDao {
  List<Beer> getAllBeers() {
    return Hive.box(kFavouriteBeersBox)
        .values
        .map((e) => BeerModel.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<void> insertBeer(Beer beer) async {
    await Hive.box(kFavouriteBeersBox)
        .put(beer.id, jsonEncode((beer as BeerModel).toJson()));
  }

  Future<void> deleteBeer(Beer beer) async {
    await Hive.box(kFavouriteBeersBox).delete(beer.id);
  }
}
