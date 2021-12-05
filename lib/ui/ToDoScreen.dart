import 'dart:js';

import 'package:flutter/material.dart';
class ToDoScreen extends StatefulWidget{
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen>{
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Item",
        backgroundColor: Color.fromRGBO(0x42, 0x60, 0xA9, 1),
        child: ListTile(
          title: Icon(Icons.add),
        ),
        onPressed: _showFormDialog),

    );
  }
}

void _showFormDialog() {
  var alert = AlertDialog(
    content: Row(
      children: <Widget>[
        Expanded(
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Item",
                  hintText: "example",
                  icon: Icon(Icons.note_add)
              ),
            ))
      ],
    ),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            _textEditingController.clear();
          },
          child: Text("Save")),
      FlatButton(onPressed: () => Navigator.pop(context), child: Text("Cancel"))
    ],
  );
  showFormDialog(context: context,
      builder: (_) {
        return alert;
      }
  );
}


