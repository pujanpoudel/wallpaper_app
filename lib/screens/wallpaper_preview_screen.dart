import 'package:flutter/material.dart';

class WallpaperPreviewScreen extends StatelessWidget {
  final String wallpaperUrl;

  WallpaperPreviewScreen({required this.wallpaperUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            wallpaperUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WallpaperActions(wallpaperUrl: wallpaperUrl),
          ),
        ],
      ),
    );
  }
}
