import 'package:redux/redux.dart';
import 'package:todo_list/model/Item.dart';
import 'package:todo_list/model/app_state.dart';
import 'package:todo_list/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(items: itemReducer(state.items, action));
}

Reducer<List<Item>> itemReducer = combineReducers<List<Item>>([
  TypedReducer<List<Item>, AddItemAction>(addItemReducer),
  TypedReducer<List<Item>, RemoveItemAction>(removeItemReducer),
  TypedReducer<List<Item>, RemoveItemsAction>(removeItemsReducer),
  TypedReducer<List<Item>, LoadingItemsAction>(loadingItemsReducer),
  TypedReducer<List<Item>, LoadedItemsAction>(loadedItemsReducer),
  TypedReducer<List<Item>, ItemCompletedAction>(itemCompletedReducer),
]);

List<Item> addItemReducer(List<Item> items, AddItemAction action) {
  return []
    ..addAll(items)
    ..add(Item(id: action.id, body: action.item));
}

List<Item> removeItemReducer(List<Item> items, RemoveItemAction action) {
  return List.unmodifiable(List.from(items)..remove(action.item));
}

List<Item> removeItemsReducer(List<Item> items, RemoveItemsAction action) {
  return List.unmodifiable([]);
}

List<Item> loadedItemsReducer(List<Item> items, LoadedItemsAction action) {
  return action.items;
}

List<Item> loadingItemsReducer(List<Item> items, LoadingItemsAction action) {
  return items;
}

List<Item> itemCompletedReducer(List<Item> items, ItemCompletedAction action) {
  return items
      .map((item) => item.id == action.item.id
          ? item.copyWith(completed: !item.completed)
          : item)
      .toList();
}
