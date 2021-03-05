import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_task_key_to_tech/bloc/storage.dart';
import 'add_ui.dart';
import 'event.dart';
import 'model.dart';
import 'state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  NoteState get initialState => InitialNoteState();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is GetNotesEvent) {
      List<NoteModel> notes = noteStorage.notes;
      yield FetchingNoteCompleteState(notes);
    } else if (event is OpenAddNoteUiEvent) {
      Navigator.push(
          event.context, MaterialPageRoute(builder: (context) => NotesAddUi()));
    } else if (event is AddNoteEvent) {
      yield AddingNoteInProgressState();
      noteStorage.notes.add(event.noteModel);
      yield AddingNoteCompleteState();
      List<NoteModel> notes = noteStorage.notes;
      //Navigator.pop(event.context);
      yield FetchingNoteCompleteState(notes);
    } else if (event is ViewDetailNoteEvent) {
      Navigator.push(
        event.context, MaterialPageRoute(builder: (context) => NotesAddUi(event.noteModel, event.index)));
    } else if (event is UpdateNoteEvent) {
      yield AddingNoteInProgressState();
      noteStorage.notes[event.index] = event.noteModel;
      yield AddingNoteCompleteState();
      yield FetchingNoteCompleteState(noteStorage.notes);
    } else if (event is RemoveNoteEvent) {
      noteStorage.notes.removeAt(event.index);
      yield FetchingNoteCompleteState(noteStorage.notes);
    }

  }
}