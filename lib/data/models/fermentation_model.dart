import '../../domain/entities/fermentation.dart';
import 'boil_volume_model.dart';

class FermentationModel extends Fermentation {
  FermentationModel({required super.temp});

  factory FermentationModel.fromJson(Map<String, dynamic> json) =>
      FermentationModel(
        temp: BoilVolumeModel.fromJson(json["temp"]),
      );

  Map<String, dynamic> toJson() => {
        "temp": (temp as BoilVolumeModel).toJson(),
      };
}
