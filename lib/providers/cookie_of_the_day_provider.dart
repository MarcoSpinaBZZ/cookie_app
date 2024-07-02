import 'dart:math';
import 'package:cookie_app/model/cookie.dart';
import 'package:cookie_app/services/cookie_service.dart';
import 'package:flutter/material.dart';

class CookieOfTheDayProvider extends ChangeNotifier {
  CookieOfTheDayProvider(this._cookieService){createNewCookieOfTheDay();}

  Cookie get cookieOfTheDay => _cookieOfTheDay;

  void createNewCookieOfTheDay() {
    var cookies = _cookieService.readAll();
    if (cookies.isEmpty) {
      _cookieOfTheDay = _noCookieToDay;
    } else {
      _cookieOfTheDay = cookies[Random().nextInt(cookies.length)];
    }
    notifyListeners();
  }
  
  Cookie _cookieOfTheDay = _noCookieToDay;
  CookieService _cookieService;
}

Cookie _noCookieToDay = Cookie("No cookie today", author: "bad luck");