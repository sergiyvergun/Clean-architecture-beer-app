import 'hop.dart';
import 'malt.dart';

class Ingredients {
  Ingredients({
    required this.malt,
    required this.hops,
    required this.yeast,
  });

  final List<Malt> malt;
  final List<Hop> hops;
  final String yeast;
}