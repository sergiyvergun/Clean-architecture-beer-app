import '../../domain/entities/method.dart';
import 'fermentation_model.dart';
import 'mash_temp_model.dart';

class MethodModel extends Method{
  MethodModel({required super.mashTemp, required super.fermentation, required super.twist});

  factory MethodModel.fromJson(Map<String, dynamic> json) => MethodModel(
    mashTemp: List<MashTempModel>.from(json["mash_temp"].map((x) => MashTempModel.fromJson(x))),
    fermentation: FermentationModel.fromJson(json["fermentation"]),
    twist: json["twist"],
  );

  Map<String, dynamic> toJson() => {
    "mash_temp": List<dynamic>.from((mashTemp as List<MashTempModel>).map((x) => x.toJson())),
    "fermentation": (fermentation as FermentationModel).toJson(),
    "twist": twist ?? null,
  };

}