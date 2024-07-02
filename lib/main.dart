// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cookie_app/pages/cookie_of_the_day.dart';
import 'package:cookie_app/providers/cookie_list_provider.dart';
import 'package:cookie_app/providers/cookie_of_the_day_provider.dart';
import 'package:cookie_app/services/cookie_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  var cookieService = CookieService();
  await cookieService.load();
  var cookieOfTheDayProvider = CookieOfTheDayProvider(cookieService);
  var cookieListProvider = CookieListProvider(cookieService);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => cookieListProvider),
      ChangeNotifierProvider(create: (_) => cookieOfTheDayProvider),
    ],
    child: const CookieApp(),
  ));
}

class CookieApp extends StatelessWidget {
  const CookieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CookieOfTheDayPage(),
    );
  }
}
