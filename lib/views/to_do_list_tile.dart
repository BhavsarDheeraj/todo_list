import 'package:flutter/material.dart';

class ToDoListTile extends StatefulWidget {
  final String title;
  final String subTitle;
  
  var isCompleted = false;

  ToDoListTile(this.title, this.subTitle);

  @override
  _ToDoListTileState createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.isCompleted,
        onChanged: (isChecked) {
          setState(() {
            widget.isCompleted = isChecked;
          });
          print('$isChecked');
        },
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subTitle),
    );
  }
}
