import 'package:clean_architecture_beer_app/data/models/method_model.dart';

import '../../domain/entities/beer.dart';
import '../../domain/entities/boil_volume.dart';
import '../../domain/entities/method.dart';
import 'boil_volume_model.dart';
import 'enum_values.dart';
import 'ingredients_model.dart';

class BeerModel extends Beer {
  BeerModel(
      {required super.id,
      required super.name,
      required super.tagline,
      required super.firstBrewed,
      required super.description,
      required super.imageUrl,
      required super.abv,
      required super.ibu,
      required super.targetFg,
      required super.targetOg,
      required super.ebc,
      required super.srm,
      required super.ph,
      required super.attenuationLevel,
      required super.volume,
      required super.boilVolume,
      required super.method,
      required super.ingredients,
      required super.foodPairing,
      required super.brewersTips,
      required super.contributedBy});

  factory BeerModel.fromJson(Map<String, dynamic> json) => BeerModel(
        id: json["id"],
        name: json["name"],
        tagline: json["tagline"],
        firstBrewed: json["first_brewed"],
        description: json["description"],
        imageUrl: json["image_url"],
        abv: json["abv"].toDouble(),
        ibu: json["ibu"] == null ? null : json["ibu"].toDouble(),
        targetFg: json["target_fg"],
        targetOg: json["target_og"].toDouble(),
        ebc: json["ebc"] == null ? null : json["ebc"],
        srm: json["srm"] == null ? null : json["srm"].toDouble(),
        ph: json["ph"] == null ? null : json["ph"].toDouble(),
        attenuationLevel: json["attenuation_level"].toDouble(),
        volume: BoilVolumeModel.fromJson(json["volume"]),
        boilVolume: BoilVolumeModel.fromJson(json["boil_volume"]),
        method: MethodModel.fromJson(json["method"]),
        ingredients: IngredientsModel.fromJson(json["ingredients"]),
        foodPairing: List<String>.from(json["food_pairing"].map((x) => x)),
        brewersTips: json["brewers_tips"],
        contributedBy: contributedByValues.map[json["contributed_by"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tagline": tagline,
        "first_brewed": firstBrewed,
        "description": description,
        "image_url": imageUrl,
        "abv": abv,
        "ibu": ibu == null ? null : ibu,
        "target_fg": targetFg,
        "target_og": targetOg,
        "ebc": ebc == null ? null : ebc,
        "srm": srm == null ? null : srm,
        "ph": ph == null ? null : ph,
        "attenuation_level": attenuationLevel,
        "volume": (volume as BoilVolumeModel).toJson(),
        "boil_volume": (boilVolume as BoilVolumeModel).toJson(),
        "method": (method as MethodModel).toJson(),
        "ingredients": (ingredients as IngredientsModel).toJson(),
        "food_pairing": List<dynamic>.from(foodPairing.map((x) => x)),
        "brewers_tips": brewersTips,
        "contributed_by": contributedByValues.reverse[contributedBy],
      };
}

final contributedByValues = EnumValues({
  "Ali Skinner <AliSkinner>": ContributedBy.ALI_SKINNER_ALI_SKINNER,
  "Sam Mason <samjbmason>": ContributedBy.SAM_MASON_SAMJBMASON
});
