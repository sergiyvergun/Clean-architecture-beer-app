import '../../domain/entities/malt.dart';
import 'boil_volume_model.dart';

class MaltModel extends Malt{
  MaltModel({required super.name, required super.amount});

  factory MaltModel.fromJson(Map<String, dynamic> json) => MaltModel(
    name: json["name"],
    amount: BoilVolumeModel.fromJson(json["amount"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": (amount as BoilVolumeModel).toJson(),
  };
}
