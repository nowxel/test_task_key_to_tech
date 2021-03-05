import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_key_to_tech/bloc/bloc.dart';
import 'package:test_task_key_to_tech/bloc/state.dart';

import 'event.dart';

class NotesUi extends StatefulWidget {
  @override
  _NotesUiState createState() => _NotesUiState();
}

class _NotesUiState extends State<NotesUi> {
  @override
  Widget build(BuildContext context) {
    final NoteBloc noteBloc = BlocProvider.of<NoteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        bloc: noteBloc,
        builder: (BuildContext context, NoteState state) {
          if (state is InitialNoteState) {
            return Center(
              child: Text('Welcome to notes family'),
            );
          } else if (state is FetchingNoteCompleteState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index].title),
                  subtitle: Text(state.notes[index].description),
                );
              },
            );
          }
          return Center(child: Text("Notes app home page"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteBloc.dispatch(GetNotesEvent());
        },
        child: Icon(Icons.slideshow),
      ),
    );
  }
}
