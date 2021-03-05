
import 'package:bloc/bloc.dart';
import 'package:test_task_key_to_tech/bloc/storage.dart';
import 'event.dart';
import 'model.dart';
import 'state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  // TODO: implement initialState
  NoteState get initialState => InitialNoteState();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    // TODO: implement mapEventToState

    if (event is GetNotesEvent) {
      List<NoteModel> notes = noteStorage.notes;
      yield FetchingNoteCompleteState(notes);
    }
    //return null;
  }

}