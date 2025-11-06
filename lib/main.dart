import 'package:flutter/material.dart';
import 'package:realprobation/homescreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Probation - NDHA",
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.transparent, // Make all Scaffolds transparent
      ),
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/paper.jpg",
            ), // Update path to match your assets
            fit: BoxFit.cover,
          ),
        ),
        child: Homescreen(),
      ),
    );
  }
}
