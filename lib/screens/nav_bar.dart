import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.blue.withOpacity(.5),
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // backgroundColor: Colors.lightBlue,
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // backgroundColor: Colors.lightBlue,
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // backgroundColor: Colors.lightBlue,
            label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            // backgroundColor: Colors.lightBlue,
            label: 'Favorites'),
      ],
    );
  }
}
