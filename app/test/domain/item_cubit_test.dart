import 'package:app/data/model/item.dart';
import 'package:app/domain/item_cubit.dart';
import 'package:app/domain/item_repository.dart';
import 'package:app/domain/item_state.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

List<Item> itemList = [
  Item(title: "title", description: "description"),
  Item(title: "title", description: "description"),
  Item(title: "title", description: "description")
];

void main() {
  group(ItemsCubit, () {
    late ItemsCubit cut;
    ItemRepository itemRepository = ItemRepositoryStub();

    setUp(() {
      cut = ItemsCubit(itemRepository);
    });

    // Unit test to test the Inital state
    test('initial state is Initial', () {
      expect(cut.state, equals(Initial()));
    });

    // Unit test to the loading state
    test('when get items emit state is loading', () {
      cut.getItems();
      expect(cut.state, equals(Loading()));
    });

    // Example of a bloc test.
    blocTest("when get item then get an item state with a list of items",
        build: () => cut,
        act: (cubit) => cubit.getItems(),
        expect: () => [Loading(), Items(itemList)]);
  });
}

class ItemRepositoryStub implements ItemRepository {
  @override
  Future<List<Item>> getItems() {
    return Future.value(itemList);
  }
}
