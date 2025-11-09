import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:realprobation/model/notedata.dart';
import 'package:realprobation/pages/homescreen.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('NotesDatabase');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Notedata(),
      builder: (context, child) => const MaterialApp(
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          FlutterQuillLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          // Add other locales you want to support
        ],
        debugShowCheckedModeBanner: false,
        title: 'Probation Notes - NDHA',

        home: Homescreen(),
      ),
    );
  }
}
