import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:realprobation/model/note.dart';

class Hivedata {
  final _myBox = Hive.box('NotesDatabase');

  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

    if (_myBox.get("ALL_NOTES") != null) {
      List<dynamic> savedNotes = _myBox.get("ALL_NOTES");
      for (int i = 0; i < savedNotes.length; i++) {
        Note indivNote = Note(id: savedNotes[i][0], text: savedNotes[i][1]);
        // Note[0] is the id, Note[1] is the text
        savedNotesFormatted.add(indivNote);
      }
    } else {
      savedNotesFormatted.add(Note(id: 0, text: "Begin your noting adventure"));
    }
    return savedNotesFormatted;
  }

  void saveNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [];

    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }

    _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}
