import '../../domain/entities/boil_volume.dart';
import 'enum_values.dart';

class BoilVolumeModel extends BoilVolume {
  BoilVolumeModel({required super.value, required super.unit});

  factory BoilVolumeModel.fromJson(Map<String, dynamic> json) =>
      BoilVolumeModel(
        value: json["value"].toDouble(),
        unit: unitValues.map[json["unit"]]!,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
      };
}

final unitValues = EnumValues({
  "celsius": Unit.CELSIUS,
  "grams": Unit.GRAMS,
  "kilograms": Unit.KILOGRAMS,
  "litres": Unit.LITRES
});
