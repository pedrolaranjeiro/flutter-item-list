import 'package:app/domain/item_cubit.dart';
import 'package:app/domain/item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const itemListKey = Key("itemListKey");
const loadingKey = Key("loadingKey");

/**
 * Home screen - show a list of items downloaded from the server
 */
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ItemsCubit, ItemsState>(builder: (context, state) {
            // Handle state changes.
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

  // UI when there is a state error
  Widget buildError() {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Center(
          child: Text(
              "There was an error getting the items. Is the server running?"),
        ),
    );
  }

  // UI for loading stte
  Widget buildLoading() => const Center(child: CircularProgressIndicator(key: loadingKey,));

  // UI for Item state. It will build a list with items
  Widget buildList(Items state) {
    return ListView.builder(
        key: itemListKey,
        itemCount: state.items.length,
        itemBuilder: (BuildContext context, int index) {
          return itemUI(state, index);
        },
        );
  }

  // UI for each item in the
  ListTile itemUI(Items state, int index) {
    return ListTile(
          title: Text(state.items[index].title),
          subtitle: Text(state.items[index].description),
        );
  }
}
