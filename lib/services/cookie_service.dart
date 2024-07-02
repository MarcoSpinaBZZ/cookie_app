// ignore_for_file: prefer_final_fields

import 'package:cookie_app/model/cookie.dart';

/// implement CRUD functionality
class CookieService {
  
  Future<void> create(Cookie cookie) async {
    _cookies.insert(0, cookie);
    return _save();
  }

  List<Cookie> readAll() {
    return List.unmodifiable(_cookies);
  }

  Future<void> update(String id, String wisdom, String author) async {}

  Future<void> delete(String id) async {
    _cookies.removeWhere((cookie) => cookie.id == id);
    return _save();
  }

// Call load() before using the service
  Future<void> load() async {
    _cookies = _fakeCookieData;
    return Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> _save() async{
    // todo : should save to a DB
  }
  
  List<Cookie> _cookies = [];

  List<Cookie> _fakeCookieData = [
    Cookie("42", author: "Deep Thought"), 
    Cookie("Use your Towel", author: "Your Dad"), 
    Cookie("Good mornin'", author: "Someone"),
  ];
}
