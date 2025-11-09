import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realprobation/model/note.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:realprobation/model/notedata.dart';

class Editingnotespage extends StatefulWidget {
  bool isNewNote;
  Note note;
  Editingnotespage({
    super.key,
    required this.note,
    required this.isNewNote,
  });

  @override
  State<Editingnotespage> createState() => _EditingnotespageState();
}

class _EditingnotespageState extends State<Editingnotespage> {
  QuillController _controller = QuillController.basic();

  void initState() {
    super.initState();
    loadExistingNote();
  }

  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );
    });
  }

  void addNewNote() {
    int id = Provider.of<Notedata>(context, listen: false).getAllNotes().length;
    String text = _controller.document.toPlainText();
    Provider.of<Notedata>(
      context,
      listen: false,
    ).addNewNote(Note(id: id, text: text));
  }

  void updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<Notedata>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeBlue,
        leading: IconButton(
          onPressed: () {
            if (widget.isNewNote && !_controller.document.isEmpty()) {
              addNewNote();
            } else {
              updateNote();
            }

            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          QuillSimpleToolbar(
            controller: _controller,
            config: QuillSimpleToolbarConfig(
              // show or hide functions here
              showCodeBlock: false,
              showSearchButton: false,
              showBackgroundColorButton: false,
              showFontFamily: false,
              showLink: false,
              showInlineCode: false,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: QuillEditor.basic(controller: _controller),
            ),
          ),
        ],
      ),
    );
  }
}
