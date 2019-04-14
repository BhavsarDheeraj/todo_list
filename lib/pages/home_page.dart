import 'package:flutter/material.dart';

import 'package:todo_list/views/to_do_list_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<String>> _showAddToDoDialog(BuildContext context) async {
    String todoTitle = '';
    String todoSubtitle = '';
    return showDialog<List<String>>(
      context: context, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('What ToDo?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Title', hintText: 'eg. Feed tommy.'),
                onChanged: (value) {
                  todoTitle = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Subtitle', hintText: 'eg. After 5 pm.'),
                onChanged: (value) {
                  todoSubtitle = value;
                },
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('CREATE'),
              onPressed: () {
                Navigator.of(context).pop([todoTitle, todoSubtitle]);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('Key'),
            // onDismissed: (direction) {
            //   items.removeAt(index);
            //   Scaffold.of(context).showSnackBar(SnackBar(
            //     content: Text("Item dismissed"),
            //   ));
            // },
            child: ToDoListTile(
                'To Do ${index + 1}', 'subtitle for the todo # ${index + 1}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final List<String> todo = await _showAddToDoDialog(context);
          print("ToDo: \nTitle: ${todo?.first}, Subtitle: ${todo?.last}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
