import '../../domain/entities/mash_temp.dart';
import 'boil_volume_model.dart';

class MashTempModel extends MashTemp{
  MashTempModel({required super.temp, required super.duration});

  factory MashTempModel.fromJson(Map<String, dynamic> json) => MashTempModel(
    temp: BoilVolumeModel.fromJson(json["temp"]),
    duration: json["duration"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "temp": (temp as BoilVolumeModel).toJson(),
    "duration": duration,
  };
}