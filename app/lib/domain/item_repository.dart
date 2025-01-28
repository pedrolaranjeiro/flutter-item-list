import 'package:app/data/model/item.dart';

abstract class ItemRepository{

  Future<List<Item>> getItems();
  
}