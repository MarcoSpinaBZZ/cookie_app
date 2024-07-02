import 'package:uuid/uuid.dart';

class Cookie {
  Cookie(this._wisdom, {String author = ""}): 
  _author = author, 
  _id = const Uuid().v4();

  String get id => _id;
  String get wisdom => _wisdom;
  String get author => _author;

  final String _id;
  final String _wisdom;
  final String _author;
}