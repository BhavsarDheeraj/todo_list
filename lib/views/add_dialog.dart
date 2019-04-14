import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('What ToDo?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Title', hintText: 'eg. Feed tommy.'),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Subtitle', hintText: 'eg. After 5 pm.'),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('CREATE'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
