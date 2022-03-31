import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_puzzle_app/component/_block.dart';
import 'package:simple_puzzle_app/component/_coordinate.dart';
import 'dart:math';

class GameScene extends StatefulWidget {
  const GameScene({
    Key? key,
    required this.difficulty,

  }) : super(key: key);

  final int difficulty;
  @override
  State<GameScene> createState() => _MyGameScreenState();
}

class _MyGameScreenState extends State<GameScene> {
  List<Block> puzzleList = <Block>[];
  late int maxItem ;
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maxItem = widget.difficulty;
    generateList();
    arrangeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Scene"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text("Current move: $counter"),
          Expanded(
            flex: 2,
            child: GridView.count(
              crossAxisCount: maxItem,
              children: puzzleList
                  .map((e) => e.getResult(() => {
                        counter++,
                        if (checkMovement(e.curPosition, e.name))
                          {
                            setState(() => {}),
                          }
                      }))
                  .toList(),
            ),
          ),
        ]),
      ),
    );
  }

  void generateList() {
    List<Coordinate> curCoorList = <Coordinate>[];
    List<Coordinate> expCoorList = <Coordinate>[];

    for (int i = 0; i < maxItem; i++) {
      for (int j = 0; j < maxItem; j++) {
        curCoorList.add(Coordinate(x: i, y: j));
        expCoorList.add(Coordinate(x: i, y: j));
      }
    }

    for (int i = 0; i < Random().nextInt(5); i++) {
      curCoorList.shuffle();
      curCoorList.reversed;
    }
    for (int i = 0; i < (maxItem * maxItem); i++) {
      Block b = (i != (maxItem * maxItem) - 1)
          ? Block((i + 1).toString(), curCoorList.removeAt(0),
              expCoorList.removeAt(0))
          : Block("", curCoorList.removeAt(0), expCoorList.removeAt(0));
      puzzleList.add(b);
    }
  }

  void arrangeList() {
    puzzleList.sort(
      (a, b) => a.curPosition.getValue().compareTo(b.curPosition.getValue()),
    );
    showResults();
  }

  // Not acceptable = x+1, y+1
  /*
    Acceptable = x     , y + 1
    Acceptable = x     , y - 1
    Acceptable = x + 1 , y
    Acceptable = x - 1 , y

  */
  bool checkMovement(Coordinate itemCoor, String name) {
    bool status = false;
    List<Coordinate> posMove = <Coordinate>[];
    Coordinate a = Coordinate(x: itemCoor.x, y: itemCoor.y + 1);
    Coordinate b = Coordinate(x: itemCoor.x, y: itemCoor.y - 1);
    Coordinate c = Coordinate(x: itemCoor.x + 1, y: itemCoor.y);
    Coordinate d = Coordinate(x: itemCoor.x - 1, y: itemCoor.y);

    if (a.isInvalid(maxItem)) {
      posMove.add(a);
    }
    if (b.isInvalid(maxItem)) {
      posMove.add(b);
    }
    if (c.isInvalid(maxItem)) {
      posMove.add(c);
    }
    if (d.isInvalid(maxItem)) {
      posMove.add(d);
    }

    Block space = puzzleList.where((element) => element.name.isEmpty).first;
    for (int i = 0; i < posMove.length; i++) {
      if (space.curPosition.isSame(posMove.elementAt(i))) {
        status = true;
        break;
      }
    }

    if (status) {
      Block itemBlock =
          puzzleList.where((element) => element.name == name).first;
      Block tempBlock = Block(space.name, space.curPosition, space.expPosition);
      puzzleList
          .where((element) => element.name.isEmpty)
          .first
          .updateBlock(itemBlock);
      puzzleList
          .where((element) => element.name == name)
          .first
          .updateBlock(tempBlock);
      arrangeList();
      showResults();
    }
    return status;
  }

  void pass() {}

  void showResults() {
    bool result = true;
    puzzleList.forEach((element) {
      result &= element.checkResult();
    });

    if (result) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext builder) => AlertDialog(
                title: const Text("Congratulations!"),
                content: Container(
                  width: 300,
                  height: 300,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Column(children: [ 
                    Text("You Solved It in $counter!!"),
                    ElevatedButton(
                      child: const Text("Return"),
                      onPressed: ()=>{
                        Navigator.pop(context),
                        Navigator.pop(context),
                      }, )
                   ])),
                ),
              ));
    }
  }
}
