import 'package:app/data/model/item.dart';
import 'package:app/domain/item_repository.dart';
import 'package:app/domain/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsCubit extends Cubit<ItemsState> {
  
  ItemRepository itemRepository;

  ItemsCubit(this.itemRepository) : super(Initial());

  // Get items from repository.
  Future<void> getItems() async {
    emit(Loading());
    try {
      List<Item> items = await itemRepository.getItems();
      emit(Items(items));
    } on Exception {
      emit(Error());
    }
  }

}
