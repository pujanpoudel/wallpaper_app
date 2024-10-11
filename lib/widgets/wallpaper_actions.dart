import 'package:flutter/material.dart';

class WallpaperActions extends StatelessWidget {
  final String wallpaperUrl;

  WallpaperActions({required this.wallpaperUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.file_download, color: Colors.white),
            onPressed: () {
              // Implement download functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Implement favorite functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.wallpaper, color: Colors.white),
            onPressed: () {
              // Implement set as wallpaper functionality
            },
          ),
        ],
      ),
    );
  }
}
