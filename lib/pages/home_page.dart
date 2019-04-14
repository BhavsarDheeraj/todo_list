import 'package:flutter/material.dart';
import 'package:todo_list/views/add_dialog.dart';
import 'package:todo_list/views/todo_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      // body: ToDoList(),
      body: ToDoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  _openAddDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AddDialog());
  }
}
