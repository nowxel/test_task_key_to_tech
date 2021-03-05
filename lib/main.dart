import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_key_to_tech/bloc/bloc.dart';
// import 'package:test_task_key_to_tech/bloc/model.dart';

import 'package:test_task_key_to_tech/bloc/ui.dart';
import 'package:test_task_key_to_tech/bloc/add_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteBloc>(
            builder: (context) => NoteBloc(), child: NotesUi()),
        BlocProvider<NoteBloc>(
            builder: (context) => NoteBloc(), child: NotesAddUi()),
        BlocProvider<NoteBloc>(
            builder: (context) => NoteBloc(), child: NotesAddUi()),
      ],
      child: MaterialApp(home: NotesUi()),
    );
  }
}