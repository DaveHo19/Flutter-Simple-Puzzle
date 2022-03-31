import 'package:flutter/material.dart';

import '_coordinate.dart';

class Block{

  late String name;  //this can be photo if want.

  late Coordinate curPosition;
  late Coordinate expPosition;

  Block(String n, Coordinate cPos, Coordinate ePos){
    name = n;
    curPosition = cPos;
    expPosition = ePos;
  }

  Widget getResult(VoidCallback action){
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: (name.isEmpty) ? Colors.black : (curPosition.isSame(expPosition)) ? Colors.green : Colors.grey,
            width: 5),
            //color: (name.isEmpty) ? Colors.white : Colors.grey,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: (curPosition.isSame(expPosition) ? FontWeight.bold : FontWeight.normal),
            )),
        ),      
      ),
      onTap: action,
    );
  }

  void updateBlock(Block targetBlock){
    curPosition = targetBlock.curPosition;
  }

  @override
  String toString() => "Name: $name, CurPos: " + curPosition.toString() + ", ExpPos: " + expPosition.toString();
  
  bool checkResult() => (curPosition.isSame(expPosition));

}