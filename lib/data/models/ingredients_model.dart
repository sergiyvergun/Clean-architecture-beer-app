
import 'package:clean_architecture_beer_app/data/models/hop_model.dart';
import 'package:clean_architecture_beer_app/data/models/malt_model.dart';

import '../../domain/entities/ingredients.dart';

class IngredientsModel extends Ingredients{
  IngredientsModel({required super.malt, required super.hops, required super.yeast});

  factory IngredientsModel.fromJson(Map<String, dynamic> json) => IngredientsModel(
    malt: List<MaltModel>.from(json["malt"].map((x) => MaltModel.fromJson(x))),
    hops: List<HopModel>.from(json["hops"].map((x) => HopModel.fromJson(x))),
    yeast: json["yeast"],
  );

  Map<String, dynamic> toJson() => {
    "malt": List<dynamic>.from((malt as List<MaltModel>).map((x) => x.toJson())),
    "hops": List<dynamic>.from((hops as List<HopModel>).map((x) => x.toJson())),
    "yeast": yeast,
  };

}