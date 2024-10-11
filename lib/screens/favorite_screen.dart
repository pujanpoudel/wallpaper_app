import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/wallpaper_grid.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: WallpaperGrid(showFavorites: true),
    );
  }
}
