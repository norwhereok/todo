import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget{
  String? _itemName;
  String? _dataCreated;
  String? _deadLine;
  int? _id;

  ToDoItem(this._itemName,this._dataCreated,this._deadLine);

  ToDoItem.map(dynamic obj){
    this._itemName=obj["itemName"];
    this._deadLine=obj["deadLine"];
    this._dataCreated=obj["dataCreated"];
    this._id=obj["id"];
  }
  String? get itemName => _itemName;
  String? get dateCreated => _dataCreated;
  String? get deadLine => _deadLine;
  int? get id => _id;

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["itemName"]=_itemName;
    map["dataCreated"]=_dataCreated;
    map["deadLine"]=_deadLine;
    if(_id != null){
      map["id"]=_id;
    }
    return map;
  }

  ToDoItem.fromMap(Map<String,dynamic> map){
    this._itemName=map["itemName"];
    this._deadLine=map["deanLinme"];
    this._dataCreated=map["dataCreated"];
    this._id=map["id"];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Text(_itemName!,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.9
            ),),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text("Deadline on: $_deadLine",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13.5,
              fontStyle: FontStyle.italic
            ),),
          )
        ],
      ),
    );
  }
}