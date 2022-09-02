import '../../domain/entities/hop.dart';
import 'boil_volume_model.dart';
import 'enum_values.dart';

class HopModel extends Hop {
  HopModel(
      {required super.name,
      required super.amount,
      required super.add,
      required super.attribute});

  factory HopModel.fromJson(Map<String, dynamic> json) => HopModel(
        name: json["name"],
        amount: BoilVolumeModel.fromJson(json["amount"]),
        add: addValues.map[json["add"]]!,
        attribute: attributeValues.map[json["attribute"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": (amount as BoilVolumeModel).toJson(),
        "add": addValues.reverse[add],
        "attribute": attributeValues.reverse[attribute],
      };
}

final addValues = EnumValues({
  "dry hop": Add.DRY_HOP,
  "end": Add.END,
  "middle": Add.MIDDLE,
  "start": Add.START
});

final attributeValues = EnumValues({
  "aroma": Attribute.AROMA,
  "Flavour": Attribute.ATTRIBUTE_FLAVOUR,
  "bitter": Attribute.BITTER,
  "flavour": Attribute.FLAVOUR
});
