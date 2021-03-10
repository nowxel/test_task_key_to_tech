import 'dart:io';

class NoteModel {
  String _title;
  String _description;
  File _image;

  NoteModel(this._title, this._description, this._image);

  String get description => _description;

  String get title => _title;

  File get picture => _image;
}