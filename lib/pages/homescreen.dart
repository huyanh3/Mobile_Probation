import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realprobation/model/note.dart';
import 'package:realprobation/model/notedata.dart';
import 'package:realprobation/pages/EditingNotesPage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<Notedata>(context, listen: false).initNotes();
  }

  void createNewNote() {
    int id = Provider.of<Notedata>(context, listen: false).getAllNotes().length;

    Note newNote = Note(
      id: id,
      text: '',
    );

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            Editingnotespage(note: note, isNewNote: isNewNote),
      ),
    );
  }

  void deleteNote(Note note) {
    Provider.of<Notedata>(context, listen: false).deleteNote(note);
  }

  void deleteAllNotes() {
    Provider.of<Notedata>(context, listen: false).deletedAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Notedata>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 10),
              child: FloatingActionButton(
                onPressed: createNewNote,
                foregroundColor: Colors.black,
                backgroundColor: Colors.amber,
                elevation: 10,
                child: Icon(Icons.create),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(right: 10),
              child: FloatingActionButton(
                onPressed: () => deleteAllNotes(),
                backgroundColor: Colors.red,
                child: Icon(Icons.dangerous),
              ),
            ),
          ],
        ),
        backgroundColor: CupertinoColors.systemGroupedBackground,
        appBar: AppBar(
          title: Text("Your notes"),
          backgroundColor: const Color.fromARGB(255, 110, 167, 214),
          shadowColor: Colors.black,
          elevation: 10,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                value.getAllNotes().length == 0
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Text("Nothing here"),
                        ),
                      )
                    : CupertinoListSection.insetGrouped(
                        children: List.generate(
                          value.getAllNotes().length,
                          (index) => CupertinoListTile(
                            title: Text(value.getAllNotes()[index].text),
                            onTap: () =>
                                goToNotePage(value.getAllNotes()[index], false),
                            trailing: IconButton(
                              onPressed: () =>
                                  value.deleteNote(value.getAllNotes()[index]),
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
