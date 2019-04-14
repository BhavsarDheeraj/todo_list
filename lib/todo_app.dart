import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:todo_list/model/app_state.dart';

import 'package:todo_list/redux/reducers.dart';
import 'package:todo_list/redux/actions.dart';
import 'package:todo_list/redux/middleware.dart';
import 'package:todo_list/pages/home_page.dart';

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DevToolsStore<AppState> store = DevToolsStore<AppState>(appStateReducer,
        initialState: AppState.initialState(),
        middleware: appStateMiddleware());

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ToDo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: StoreBuilder<AppState>(
          onInit: (store) => store.dispatch(GetItemsAction()),
          builder: (BuildContext context, Store<AppState> store) =>
              HomePage(store),
        ),
      ),
    );
  }
}
