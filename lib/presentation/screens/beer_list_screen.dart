import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/presentation/components/beer_list.dart';
import '../../utils/constants/routes.dart';
import '../blocs/beer_list_cubit/beer_list_cubit.dart';

class BeerListScreen extends StatelessWidget {
  const BeerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks_outlined),
            onPressed: () {
              context.push(Routes.favourites);
            },
          )
        ],
      ),
      body: BlocBuilder<BeerListCubit, BeerListState>(
        builder: (context, state) {
          if (state is BeerListRequestSucceed) {
            return BeerList(beerList: state.beerList);
          }
          if (state is BeerListRequestFailed) {
            return Text(state.error.message);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
