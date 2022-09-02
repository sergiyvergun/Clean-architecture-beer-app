import 'boil_volume.dart';

class MashTemp {
  MashTemp({
    required this.temp,
    this.duration,
  });

  final BoilVolume temp;
  final int? duration;
}