import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_key_to_tech/bloc/bloc.dart';
import 'package:test_task_key_to_tech/bloc/event.dart';
import 'package:test_task_key_to_tech/bloc/model.dart';
import 'package:test_task_key_to_tech/bloc/state.dart';


class NotesAddUi extends StatefulWidget {
  NoteModel model;
  int index;
  NotesAddUi([this.model, this.index]);
  @override
  _NotesAddUiState createState() => _NotesAddUiState();
}

class _NotesAddUiState extends State<NotesAddUi> {
  TextEditingController titleController;
  TextEditingController descriptionController;
  TextEditingController imageController;
  NoteBloc noteBloc;
  bool _isEmpty = true;

  @override
  initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    imageController = TextEditingController();
    if (widget.model != null) {
      _isEmpty = false;
      titleController.text = widget.model.title;
      descriptionController.text = widget.model.description;
      imageController.text = widget.model.description;
    }
  }

  void addNote() {
    noteBloc.dispatch(AddNoteEvent(
        NoteModel(titleController.text, descriptionController.text, imageController.text)));
    Navigator.pop(context);
  }

  void updateNote() {
    noteBloc.dispatch(UpdateNoteEvent(NoteModel(titleController.text, descriptionController.text, imageController.text), widget.index));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    noteBloc = BlocProvider.of<NoteBloc>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter title",
                alignLabelWithHint: true,
              ),
              controller: titleController,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter description",
                alignLabelWithHint: true,
              ),
              controller: descriptionController,
            ),
            SizedBox(
              height: 16,
            ),
            BlocBuilder<NoteBloc, NoteState>(
                bloc: noteBloc,
                builder: (BuildContext context, NoteState state) {
                  if (state is AddingNoteInProgressState) {
                    return Center(child: CircularProgressIndicator());
                  } else
                    return RaisedButton(
                      onPressed: () {
                        if (_isEmpty) {
                          addNote();
                        } else {
                          updateNote();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Add'),
                      ),
                    );
                }),
          ],
        ),
      ),
    );
  }


}