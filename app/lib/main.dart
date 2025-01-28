import 'package:app/data/repositories/items_repository_impl.dart';
import 'package:app/domain/item_cubit.dart';
import 'package:app/domain/item_repository.dart';
import 'package:app/presentation/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const FlutterTechnicalTest());
}

class FlutterTechnicalTest extends StatelessWidget {
  const FlutterTechnicalTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<ItemRepository>(create: (context) => ItemRepositoryImp()),
        BlocProvider<ItemsCubit>(create: (BuildContext context) => ItemsCubit(context.read())),
      ],
      child: MaterialApp(
        title: 'Flutter Technical Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
