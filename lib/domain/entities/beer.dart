
import 'boil_volume.dart';
import 'ingredients.dart';
import 'method.dart';

class Beer {
  Beer({
    required this.id,
    required this.name,
    required this.tagline,
    required this.firstBrewed,
    required this.description,
    required this.imageUrl,
    required this.abv,
    this.ibu,
    required this.targetFg,
    required this.targetOg,
    this.ebc,
    this.srm,
    this.ph,
    required this.attenuationLevel,
    required this.volume,
    required this.boilVolume,
    required this.method,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
    required this.contributedBy,
  });

  final int id;
  final String name;
  final String tagline;
  final String firstBrewed;
  final String description;
  final String imageUrl;
  final double abv;
  final double? ibu;
  final int targetFg;
  final double targetOg;
  final int? ebc;
  final double? srm;
  final double? ph;
  final double attenuationLevel;
  final BoilVolume volume;
  final BoilVolume boilVolume;
  final Method method;
  final Ingredients ingredients;
  final List<String> foodPairing;
  final String brewersTips;
  final ContributedBy contributedBy;
}

enum ContributedBy { SAM_MASON_SAMJBMASON, ALI_SKINNER_ALI_SKINNER }
