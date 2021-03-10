import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_task_key_to_tech/bloc/state.dart';

import 'bloc.dart';
import 'event.dart';
import 'model.dart';



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

  File _pickedImage;

  //final picker = ImagePicker();

  void _pickImage() async {
    final File getImage = await ImagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,

    );
    setState(() {
      if (getImage != null) {
        _pickedImage = File(getImage.path);
//widget.imagePickerFun(_pickedImage);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    imageController = TextEditingController();
    if (widget.model != null) {
      _isEmpty = false;
      _pickedImage = widget.model.picture;
      titleController.text = widget.model.title;
      descriptionController.text = widget.model.description;
      imageController.text = widget.model.description;
    }
  }

  void addNote() {
    noteBloc.dispatch(AddNoteEvent(
        NoteModel(titleController.text, descriptionController.text, _pickedImage)));
    Navigator.pop(context);
  }

  void updateNote() {
    noteBloc.dispatch(UpdateNoteEvent(NoteModel(titleController.text, descriptionController.text, _pickedImage), widget.index));
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
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.grey,
              backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              label: Text('Add Image'),
              onPressed: _pickImage,
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