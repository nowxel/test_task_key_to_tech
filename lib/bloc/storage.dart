import 'package:test_task_key_to_tech/bloc/model.dart';

class NoteStorage {
  List<NoteModel> _noteModels = [
    NoteModel("Chemistry", "Get book from general store", ''),
    NoteModel("Physics", "Read reference book", ""),
    NoteModel("Maths", "It's really hard bro, if you don't study", ""),
    NoteModel("Football", "Match at 8'o' clock", ""),
  ];

  List<NoteModel> get notes => _noteModels;
}

NoteStorage noteStorage = NoteStorage();