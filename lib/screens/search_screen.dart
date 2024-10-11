import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/wallpaper_grid.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Wallpapers')),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(child: WallpaperGrid()),
        ],
      ),
    );
  }
}
