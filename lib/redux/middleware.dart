import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
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

// Middleware<AppState> _getAllNotes(AppState state) {
//   return (Store<AppState> store, action, NextDispatcher next) {
//     next(action);
//     store.dispatch(LoadingItemsAction());
//     getAllNotes()
//         .then((state) => store.dispatch(LoadedItemsAction(state.items)));
//   };
// }

// Future<AppState> getAllNotes() async {
//   final String url = 'http://localhost:3000/todos';
//   var res = await http
//       .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
//   final response = await new Future.delayed(
//     new Duration(seconds: 3),
//     () => res,
//   );
//   if (response.statusCode == 200) {
//     Map map = json.decode(response.body);
//     return AppState.fromJson(map);
//   }
//   return AppState.initialState();
// }

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
