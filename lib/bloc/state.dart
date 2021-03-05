import 'model.dart';

class NoteState {}

///list of States
///1.Fetching 2.FetchingComplete 3. EmptyState 4. InitialState
class FetchingNoteState extends NoteState {}

class FetchingNoteCompleteState extends NoteState {
  List<NoteModel> notes;

  FetchingNoteCompleteState(this.notes);
}

class EmptyNoteState extends NoteState {}

class InitialNoteState extends NoteState {}