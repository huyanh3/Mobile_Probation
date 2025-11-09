import 'package:flutter/material.dart';
import 'package:realprobation/data/hivedata.dart';
import 'package:realprobation/model/note.dart';

class Notedata extends ChangeNotifier {
  final db = Hivedata();

  void initNotes() {
    db.loadNotes();
  }

  List<Note> allNotes = [
    Note(id: 0, text: "ur mom"),
    Note(id: 1, text: "ur mom"),
    Note(id: 2, text: "ur mom"),
    Note(id: 3, text: "ur mom"),
    Note(id: 4, text: "ur mom"),
    Note(id: 5, text: "ur mom"),
    Note(id: 6, text: "ur mom"),
    Note(id: 7, text: "ur mom"),
    Note(id: 8, text: "ur mom"),
    Note(id: 9, text: "ur mom"),
    Note(id: 10, text: "ur mom"),
    Note(id: 11, text: "ur mom"),
    Note(id: 12, text: "ur mom"),
    Note(id: 13, text: "ur mom"),
    Note(id: 14, text: "ur mom"),
    Note(id: 15, text: "ur mom"),
    Note(id: 16, text: "ur mom"),
    Note(id: 17, text: "ur mom"),
  ];

  List<Note> getAllNotes() {
    return allNotes;
  }

  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }

  void deletedAllNotes() {
    allNotes.clear();
    notifyListeners();
  }
}
