import 'package:cookie_app/model/cookie.dart';
import 'package:cookie_app/services/cookie_service.dart';
import 'package:flutter/material.dart';

class CookieListProvider extends ChangeNotifier {
  CookieListProvider(this._cookieService);

    List<Cookie> get cookies => _cookieService.readAll();

  void addCookie(String wisdom, String author) {
    _cookieService
        .create(Cookie(wisdom, author: author))
        .then ((_) => notifyListeners());
}

  final CookieService _cookieService;

  void deleteCookie(String id) {
    _cookieService.delete(id).then((_) => notifyListeners());
  }
}
