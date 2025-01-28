
import 'package:app/data/model/item.dart';
import 'package:equatable/equatable.dart';

sealed class ItemsState extends Equatable {
  const ItemsState();
}

final class Initial extends ItemsState {
  @override
  List<Object> get props => [];
}

final class Loading extends ItemsState {
  @override
  List<Object?> get props => [];
}

final class Error extends ItemsState {


  @override
  List<Object?> get props => [];
}

final class Items extends ItemsState {
  final List<Item> items;

  const Items(this.items);

  @override
  List<Object?> get props => [items];
}