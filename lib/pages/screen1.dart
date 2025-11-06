import 'package:flutter/material.dart';

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

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 70,
            top: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onPress,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.brown[100], // Button color
                    foregroundColor: Colors.black, // Icon color
                  ),
                  child: Icon(Icons.add),
                ),

                // GestureDetector(
                //   child: Center(
                //     child: Container(
                //       width: 50,
                //       height: 50,
                //       color: Colors.brown[100],
                //       // margin: EdgeInsets.all(10),
                //       child: Center(child: Icon(Icons.add)),
                //     ),
                //   ),
                //   onTap: () => print("noted"),
                // ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.yellow[150],
                      border: OutlineInputBorder(),
                      hintText: "Write what you want to do here",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(),
        ],
      ),
    );
  }
}
