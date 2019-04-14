import 'package:flutter/material.dart';
import 'package:todo_list/model/view_model.dart';

class AddDialog extends StatefulWidget {
  final ViewModel model;

  AddDialog(this.model);

  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a Todo...'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            maxLength: 20,
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'Todo', hintText: 'eg. Feed tommy.'),
          ),
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
            _onCreateTap();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _onCreateTap() {
    if (controller.text != null && controller.text.isNotEmpty) {
      widget.model.onAddItem(controller.text);
    }
  }
}
