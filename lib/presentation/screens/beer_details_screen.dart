import 'package:flutter/material.dart';

import '../../domain/entities/beer.dart';

class BeerDetailsScreen extends StatelessWidget {
  const BeerDetailsScreen({Key? key, required this.beer}) : super(key: key);

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        children: [
          Hero(
              tag: beer.id,
              child: Image.network(
                beer.imageUrl,
                height: 400,
              )),
          const SizedBox(height: 30),
          Text(
            beer.name,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
          ),
          const SizedBox(height: 15),
          Text(
            beer.description,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const SizedBox(height: 25),
          const Text(
            'Malt',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          const SizedBox(height: 5),
          Text(
            beer.ingredients.malt
                .map((e) => e.name)
                .toString()
                .replaceAll('(', '')
                .replaceAll(')', ''),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 15),
          const Text(
            'Hops',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          const SizedBox(height: 5),
          Text(
            beer.ingredients.hops
                .map((e) => e.name)
                .toString()
                .replaceAll('(', '')
                .replaceAll(')', ''),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(height: 15),
          const Text(
            'Food pairings',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          const SizedBox(height: 5),
          Text(
            beer.foodPairing.toString().replaceAll('[', '').replaceAll(']', ''),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
