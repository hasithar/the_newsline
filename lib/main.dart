import 'package:flutter/material.dart';
import 'package:the_newsline/pages/home.page.dart';

void main() {
  runApp(MaterialApp(
    title: 'The NewsLine',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0,
        toolbarHeight: 80
      )
    ),
    home: const Home(),
  ));
}


