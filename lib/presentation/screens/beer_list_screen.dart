import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/components/beer_list.dart';
import '../blocs/beer_list_cubit/beer_list_cubit.dart';

class BeerListScreen extends StatelessWidget {
  const BeerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: BlocBuilder<BeerListCubit, BeerListState>(
        builder: (context, state) {
          if(state is BeerListRequestSucceed){
            return BeerList(beerList: state.beerList);
          }
          if(state is BeerListRequestFailed){
            return Text(state.error.message);
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
