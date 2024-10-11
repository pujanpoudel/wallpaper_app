import 'package:flutter/material.dart';

class FeaturedWallpapers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Featured Wallpapers')),
      body: WallpaperGrid(),
    );
  }
}
