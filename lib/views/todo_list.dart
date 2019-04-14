import 'package:flutter/material.dart';
import 'package:todo_list/model/view_model.dart';
import 'package:todo_list/views/to_do_list_item.dart';

class ToDoList extends StatelessWidget {
  final ViewModel model;

  ToDoList(this.model);

  @override
  Widget build(BuildContext context) {
    if (model.items.length > 0) {
      return SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                height: 0.5,
              ),
          itemCount: model.items.length,
          itemBuilder: (context, position) {
            return Dismissible(
                key: Key('${model.items[position].id}'),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  model.onRemoveItem(model.items[position]);
                },
                background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
                child: ToDoListItem(model, model.items[position]));
          },
        ),
      );
    } else {
      return SafeArea(
        child: Center(
          child: Text(
            'Tap \'+\' to add.',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      );
    }
  }
}
