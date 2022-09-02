class BoilVolume {
  BoilVolume({
    required this.value,
    required this.unit,
  });

  final double value;
  final Unit unit;
}

enum Unit { LITRES, GRAMS, KILOGRAMS, CELSIUS }
