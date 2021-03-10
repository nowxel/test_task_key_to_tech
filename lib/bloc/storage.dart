import 'package:test_task_key_to_tech/bloc/model.dart';

class NoteStorage {
  List<NoteModel> _noteModels = [

  ];

  List<NoteModel> get notes => _noteModels;
}

NoteStorage noteStorage = NoteStorage();