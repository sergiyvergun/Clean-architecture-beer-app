import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/beer.dart';
import '../../../utils/constants/routes.dart';

class BeerTile extends StatelessWidget {
  const BeerTile({Key? key,required this.beer}) : super(key: key);
  final Beer beer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(Routes.beerDetails, extra: beer);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Hero(
                tag: beer.id,
                child: Image.network(
                  beer.imageUrl,
                  height: 200,
                  width: 150,
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'ABV: ${beer.abv}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
