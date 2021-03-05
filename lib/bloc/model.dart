class NoteModel {
  String _title;
  String _description;
  String _image;

  NoteModel(this._title, this._description, this._image);

  String get description => _description;

  String get title => _title;

  String get picture => _image;
}