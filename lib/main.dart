import 'package:flutter/material.dart';
import 'package:the_newsline/pages/home.page.dart';
import 'package:the_newsline/pages/search.page.dart';

void main() {
  runApp(MaterialApp(
    title: 'The NewsLine',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Lato',
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Color.fromRGBO(0, 21, 69, 1),
        elevation: 0,
        toolbarHeight: 80
      ),
    ),
    routes: {
      '/': (context) => const Home(),
      '/search': (context) => const Search()
    },
    initialRoute: '/',
  ));
}


