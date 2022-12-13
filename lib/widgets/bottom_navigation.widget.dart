import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedIconTheme: const IconThemeData(color: Colors.redAccent),
      selectedItemColor: Colors.redAccent,
      unselectedIconTheme: const IconThemeData(
          color: Color.fromRGBO(0, 21, 69, 1)
      ),
      unselectedItemColor: const Color.fromRGBO(0, 21, 69, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.nightlight_round),
          label: 'Dark Mode',
        ),
      ],
      onTap: (index) {
        switch(index) {
          case 0: {
            Navigator.pushNamed(context, "/search");
          }
          break;
          case 1: {
            Navigator.pushNamed(context, "/");
          }
          break;
          default:
            break;
        }
      },
    );
  }
}
