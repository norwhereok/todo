import 'package:flutter/material.dart';

import 'ToDoScreen.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
        backgroundColor: Color.fromRGBO(0x3E, 0x6C, 0x8D, 1),
      ),
      body: ToDoScreen(),
    );
  }
}