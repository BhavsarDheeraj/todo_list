import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
// import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/app_state.dart';

import 'package:todo_list/redux/actions.dart';

List<Middleware<AppState>> appStateMiddleware(
    [AppState state = const AppState(items: [])]) {
  final loadItems = _loadFromPrefs(state);
  final saveItems = _saveToPrefs(state);

  return [
    TypedMiddleware<AppState, AddItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemAction>(saveItems),
    TypedMiddleware<AppState, RemoveItemsAction>(saveItems),
    TypedMiddleware<AppState, GetItemsAction>(loadItems),
  ];
}

Middleware<AppState> _loadFromPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    loadFromPrefs()
        .then((state) => store.dispatch(LoadedItemsAction(state.items)));
  };
}

Middleware<AppState> _saveToPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    saveToPrefs(store.state);
  };
}

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(state.toJson());
  await preferences.setString('itemState', string);
}

Future<AppState> loadFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('itemState');
  if (string != null) {
    Map map = json.decode(string);
    await new Future.delayed(Duration(seconds: 3));
    return AppState.fromJson(map);
  }
  return AppState.initialState();
}
