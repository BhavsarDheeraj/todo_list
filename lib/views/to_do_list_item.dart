import 'package:flutter/material.dart';

class ToDoListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Checkbox(value: true, onChanged: null),
      title: Text('Title'),
      subtitle: Text('Subtitle'),
    );
  }
}
