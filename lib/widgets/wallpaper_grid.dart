import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/wallpaper_preview_screen.dart';

class WallpaperGrid extends StatelessWidget {
  final bool showFavorites;

  WallpaperGrid({this.showFavorites = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WallpaperPreviewScreen(
                  wallpaperUrl: 'https://example.com/wallpaper$index.jpg',
                ),
              ),
            );
          },
          child: Hero(
            tag: 'wallpaper$index',
            child: Image.network(
              'https://example.com/wallpaper$index.jpg',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
