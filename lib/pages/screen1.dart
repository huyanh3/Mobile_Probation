import 'package:flutter/material.dart';
import 'package:realprobation/util/toDoTile.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String message = "";

  void onPress() {
    setState(() {
      message = "" + _textController.text;
    });
  }

  List todoList = [
    ["Make food", false],
    ["Walk the dog", true],
    ["Do homework", false],
    ["Clean the house", true],
    ["Read a book", false],
  ];

  void checkedBoxState(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
      // Update the checkbox state here
    });
  }

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Top section with button and TextField
          Padding(
            padding: const EdgeInsets.only(left: 70, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onPress,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.brown[100],
                    foregroundColor: Colors.black,
                  ),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[50],
                      border: OutlineInputBorder(),
                      hintText: "Write what you want to do here",
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ListView section with TodoTiles
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Todotile(
                    taskName: todoList[index][0],
                    taskCompleted: todoList[index][1],
                    onChanged: (value) => checkedBoxState(value, index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
