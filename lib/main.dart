import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_puzzle_app/screen/GameScene.dart';
import 'component/_block.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BaseScene(),
    );
  }
}

class BaseScene extends StatefulWidget {
  const BaseScene({Key? key}) : super(key: key);

  @override
  State<BaseScene> createState() => _MyBaseSceneState();
}

class _MyBaseSceneState extends State<BaseScene> {
  int maxComponent = 3;
  List<Block> blockList = <Block>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puzzle Demo"),
      ),
      body: const Center(
        child: MenuSelection(),
      ),
    );
  }
}

class MenuSelection extends StatelessWidget {
  const MenuSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              child: const Text("Start"),
              onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext builder) => AlertDialog(
                              title: const Text("Difficulty"),
                              content: Container(
                                width: 300,
                                height: 300,
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            startGame(context, 3),
                                          },
                                          child: const Text("Easy"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  Navigator.pop(context),
                                                  startGame(context, 5),
                                                },
                                            child: const Text("Medium")),
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  Navigator.pop(context),
                                                  startGame(context, 7),
                                                },
                                            child: const Text("Hard")),
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  Navigator.pop(context),
                                                  startGame(context, 10),
                                                },
                                            child: const Text("Hell")),
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: ElevatedButton(
                                            onPressed: () => {
                                                  Navigator.pop(context),
                                                  startGame(context,
                                                      Random().nextInt(15)),
                                                },
                                            child: const Text("Random")),
                                      ),
                                      // SizedBox(
                                      //   width: 125,
                                      //   height: 35,
                                      //   child: ElevatedButton(
                                      //       onPressed: () => {
                                      //             Navigator.pop(context),
                                      //             showValueDialog(context),
                                      //           },
                                      //       child: const Text("Your own choice")),
                                      // ),
                                    ]),
                              ),
                            ))
                  }),
        ],
      ),
    );
  }

  void startGame(BuildContext context, int difficulty) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GameScene(difficulty: difficulty)));

  void showValueDialog(BuildContext context) {
    TextEditingController textValue = TextEditingController();
     showDialog(
        context: context,
        builder: (BuildContext builder) => AlertDialog(
              title: const Text("Enter your choice"),
              content: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.zero,
                child: TextField(
                  decoration: InputDecoration(
                    suffix: IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () => {
                          Navigator.pop(context),
                          startGame(context, int.parse(textValue.text)),

                          }),
                    border: const OutlineInputBorder(),
                    labelText: "Value",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                  controller: textValue,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                  keyboardType: TextInputType.number,
                ),
              ),
            ));

  }
}
