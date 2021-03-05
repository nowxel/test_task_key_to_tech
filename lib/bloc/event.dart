import 'package:flutter/cupertino.dart';
import 'package:test_task_key_to_tech/bloc/model.dart';

class NoteEvent {}

///list of events
/// 1.getNotes 2.add 3.remove 4.remove 5.viewDetailNote
class GetNotesEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  NoteModel noteModel;

  AddNoteEvent(this.noteModel);
}

class OpenAddNoteUiEvent extends NoteEvent {
  BuildContext context;
  OpenAddNoteUiEvent(this.context);
}

class RemoveNoteEvent extends NoteEvent {
  int index;
  RemoveNoteEvent(this.index);
}

class UpdateNoteEvent extends NoteEvent {
  NoteModel noteModel;
  int index;
  UpdateNoteEvent(this.noteModel, this.index);


}

class ViewDetailNoteEvent extends NoteEvent {
  BuildContext context;
  NoteModel noteModel;
  int index;
  ViewDetailNoteEvent(this.context, this.noteModel, this.index);
}