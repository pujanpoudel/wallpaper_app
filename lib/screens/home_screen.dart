import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/category_screen.dart';
import 'package:wallpaper_app/screens/favorite_screen.dart';
import 'package:wallpaper_app/screens/featured_wallpaper.dart';
import 'package:wallpaper_app/screens/nav_bar.dart';
import 'package:wallpaper_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const FeaturedWallpapers(),
    const SearchScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
