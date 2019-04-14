import 'package:flutter/material.dart';
import 'package:todo_list/model/Item.dart';
import 'package:todo_list/view_model.dart';

class ToDoListItem extends StatelessWidget {
  final ViewModel model;
  final Item item;

  ToDoListItem(this.model, this.item);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (b) {
          model.onCompleted(item);
        },
      ),
      title: Text(item.body),
    );
  }
}
