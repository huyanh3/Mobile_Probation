import 'package:flutter/material.dart';
import 'package:realprobation/pages/screen1.dart';
import 'package:realprobation/pages/screen2.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _index = 0;

  void _onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your to do list"),
        leading: Icon(Icons.notes),
        backgroundColor: Colors.yellow[700],
      ),
      body: IndexedStack(
        index: _index,
        children: [
          Screen1(),
          Screen2(),
        ],
      ),

      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home Page"),
          NavigationDestination(icon: Icon(Icons.edit), label: "Edit notes"),
        ],
        onDestinationSelected: _onItemTap,
        selectedIndex: _index,
      ),
    );
  }
}
