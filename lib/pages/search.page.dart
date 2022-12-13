import 'package:flutter/material.dart';
import 'package:the_newsline/widgets/bottom_navigation.widget.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH NEWS ARTICLES", style: TextStyle(
            fontWeight: FontWeight.w700
        ),),
      ),
      bottomNavigationBar: const BottomNavigation()
    );
  }
}
