import 'boil_volume.dart';

class Hop {
  Hop({
    required this.name,
    required this.amount,
    required this.add,
    required this.attribute,
  });

  final String name;
  final BoilVolume amount;
  final Add add;
  final Attribute attribute;
}

enum Add { START, MIDDLE, END, DRY_HOP }

enum Attribute { BITTER, FLAVOUR, AROMA, ATTRIBUTE_FLAVOUR }