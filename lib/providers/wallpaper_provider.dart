import 'package:flutter/material.dart';

class WallpaperProvider with ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void toggleFavorite(String wallpaperUrl) {
    if (_favorites.contains(wallpaperUrl)) {
      _favorites.remove(wallpaperUrl);
    } else {
      _favorites.add(wallpaperUrl);
    }
    notifyListeners();
  }
}
