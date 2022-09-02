import 'package:flutter/material.dart';

import '../../../domain/entities/beer.dart';

class BeerList extends StatelessWidget {
  const BeerList({Key? key, required this.beerList}) : super(key: key);

  final List<Beer> beerList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: beerList.length,
      itemBuilder: (context, int index) {
        Beer beer = beerList.elementAt(index);
        return InkWell(
          onTap: (){},
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SizedBox(
                    width: 150, child: Image.network(beer.imageUrl, height: 200)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        beer.name,
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ABV: ${beer.abv}',
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey[400]);
      },
    );
  }
}
