import 'package:flutter/material.dart';
import 'package:todo_list/views/to_do_list_item.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              height: 0.5,
              indent: 80,
            ),
        itemCount: 10,
        itemBuilder: (context, position) => ToDoListItem());
  }
}
