import 'package:redux/redux.dart';
import 'package:todo_list/model/Item.dart';
import 'package:todo_list/model/app_state.dart';
import 'package:todo_list/redux/actions.dart';

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function(Item) onCompleted;
  final Function() onRemoveItems;

  ViewModel(
      {this.items,
      this.onAddItem,
      this.onRemoveItem,
      this.onCompleted,
      this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    _onCompleted(Item item) {
      store.dispatch(ItemCompletedAction(item));
    }

    return ViewModel(
        items: store.state.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onCompleted: _onCompleted,
        onRemoveItems: _onRemoveItems);
  }

}