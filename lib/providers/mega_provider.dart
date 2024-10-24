import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MegaProvider with ChangeNotifier {
  static const platform = MethodChannel('com.example.wallpaper_app/mega');

  Future<void> uploadFile(String filePath) async {
    try {
      await platform.invokeMethod('uploadFile', {"filePath": filePath});
    } on PlatformException catch (e) {
      print("Failed to upload file: '${e.message}'.");
    }
  }

  Future<void> downloadFile(String fileUrl, String destination) async {
    try {
      await platform.invokeMethod(
          'downloadFile', {"fileUrl": fileUrl, "destination": destination});
    } on PlatformException catch (e) {
      print("Failed to download file: '${e.message}'.");
    }
  }

  Future<void> createCategory(String categoryName) async {
    try {
      await platform
          .invokeMethod('createCategory', {"categoryName": categoryName});
    } on PlatformException catch (e) {
      print("Failed to create category: '${e.message}'.");
    }
  }

  Future<List<String>> getCategories() async {
    try {
      final List<dynamic> categories =
          await platform.invokeMethod('getCategories');
      return categories.cast<String>();
    } on PlatformException catch (e) {
      print("Failed to get categories: '${e.message}'.");
      return [];
    }
  }

  Future<List<String>> getWallpapersInCategory(String category) async {
    try {
      final List<dynamic> wallpapers = await platform
          .invokeMethod('getWallpapersInCategory', {"category": category});
      return wallpapers.cast<String>();
    } on PlatformException catch (e) {
      print("Failed to get wallpapers: '${e.message}'.");
      return [];
    }
  }
}
