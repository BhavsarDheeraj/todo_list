import 'package:flutter/material.dart';

import 'package:todo_list/views/to_do_list_tile.dart';

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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ToDoListTile('To Do ${index+1}', 'subtitle for the todo # ${index+1}');
        },
      ),
    );
  }
}