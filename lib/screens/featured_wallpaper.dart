import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/wallpaper_grid.dart';

class FeaturedWallpapers extends StatelessWidget {
  const FeaturedWallpapers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Featured Wallpapers')),
      body: const WallpaperGrid(),
    );
  }
}
