import 'package:app/domain/item_cubit.dart';
import 'package:app/domain/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const itemListKey = Key("itemListKey");
const loadingKey = Key("loadingKey");

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
  
      if (state is Initial) {
        context.read<ItemsCubit>().getItems();
        return buildLoading();
      } else if (state is Items) {
        return buildList(state);
      } else if (state is Error) {
        return buildError();
      }
      return Container();
    }));
  }

  Center buildError() {
    return const Center(
        child: Text(
            "There was an error getting the items. Please try again later"),
      );
  }

  Center buildLoading() => const Center(child: CircularProgressIndicator(key: loadingKey,));

  ListView buildList(Items state) {
    return ListView.builder(
        key: itemListKey,
        itemCount: state.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(state.items[index].title),
            subtitle: Text(state.items[index].description),
          );
        },
        );
  }
}
