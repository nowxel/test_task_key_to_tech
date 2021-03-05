import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_key_to_tech/bloc/bloc.dart';

import 'package:test_task_key_to_tech/bloc/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<NoteBloc>(
          builder: (context) => NoteBloc(), child: NotesUi()),
    );
  }
}