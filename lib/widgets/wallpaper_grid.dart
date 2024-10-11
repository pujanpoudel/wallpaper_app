import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/wallpaper_preview_screen.dart';

class WallpaperGrid extends StatelessWidget {
  final bool showFavorites;

  const WallpaperGrid({super.key, this.showFavorites = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  wallpaperUrl:
                      'https://images.unsplash.com/photo-1542397284385-6010376c5337?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
            );
          },
          child: Hero(
            tag: 'wallpaper$index',
            child: Image.network(
              'https://images.unsplash.com/photo-1542397284385-6010376c5337?q=80&w=3348&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
