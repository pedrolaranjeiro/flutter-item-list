import 'package:app/data/model/item.dart';
import 'package:app/data/provider/items_provider.dart';
import 'package:app/domain/item_repository.dart';

class ItemRepositoryImp implements ItemRepository{
  final ItemsProvider itemsProvider = ItemsProvider();

  @override
  Future<List<Item>> getItems(){
    return itemsProvider.getItems();
  }

}