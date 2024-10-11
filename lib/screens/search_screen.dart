import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Wallpapers')),
      body: Column(
        children: [
          SearchBar(),
          Expanded(child: WallpaperGrid()),
        ],
      ),
    );
  }
}
