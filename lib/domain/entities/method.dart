import 'fermentation.dart';
import 'mash_temp.dart';

class Method {
  Method({
    required this.mashTemp,
    required this.fermentation,
    this.twist,
  });

  final List<MashTemp> mashTemp;
  final Fermentation fermentation;
  final String? twist;
}
