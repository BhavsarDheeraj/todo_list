import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:todo_list/model/app_state.dart';

import 'package:todo_list/views/add_dialog.dart';
import 'package:todo_list/model/view_model.dart';
import 'package:todo_list/views/todo_list.dart';

class HomePage extends StatelessWidget {
  final DevToolsStore<AppState> store;

  HomePage(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.5 : 5,
        leading: Builder(
          builder: (context) => IconButton(
                icon: new Icon(Icons.access_time),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text('Todo List'),
        actions: <Widget>[
          RemoveItemsButton(ViewModel.create(store)),
        ],
      ),
      // body: ToDoList(),
      body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) {
            return ToDoList(viewModel);
          }),
      drawer: Container(
        child: ReduxDevTools(store),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  _openAddDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AddDialog(ViewModel.create(store)));
  }
}

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Delete all todos.',
      icon: Icon(Icons.delete),
      onPressed: () => model.onRemoveItems(),
    );
  }
}
