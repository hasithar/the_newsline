import 'package:flutter/material.dart';
import 'package:the_newsline/pages/home.page.dart';

void main() {
  runApp(MaterialApp(
    title: 'The NewsLine',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Home(),
  ));
}


