import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/wallpaper_model.dart';

class ApiService {
  static String get apiKey {
    final key = dotenv.env['API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('API_KEY is missing or empty in .env file');
    }
    return key;
  }

  // Base URL for wallpaper search
  static String baseUrl = 'https://wallhaven.cc/api/v1';

  // Fetch wallpapers with optional search query and categories
  static Future<List<Wallpaper>> fetchWallpapers() async {
    try {
      // Print the API URL to verify its correctness
      print("Constructed API URL: $baseUrl");

      // Send request and log response
      final response = await http.get(Uri.parse(baseUrl));
      print("API Response status: ${response.statusCode}");
      print("API Response body: ${response.body}");

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body)['data'];
        return data
            .map((wallpaperJson) => Wallpaper.fromJson(wallpaperJson))
            .toList();
      } else {
        throw Exception('Failed to load wallpapers: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in fetchWallpapers: $e");
      throw Exception('Failed to fetch wallpapers');
    }
  }

  // Search wallpapers by keyword (using the "query" parameter)
  static Future<List<Wallpaper>> searchWallpapers(String keyword) async {
    final url = '$baseUrl/search?apikey=$apiKey&q=$keyword';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data
          .map((wallpaperJson) => Wallpaper.fromJson(wallpaperJson))
          .toList();
    } else {
      throw Exception('Failed to search wallpapers');
    }
  }

  // Get wallpapers by category (e.g., "general", "anime", etc.)
  static Future<List<Wallpaper>> getWallpapersByCategory(
      String categoryCode) async {
    final url = '$baseUrl/search?apikey=$apiKey&categories=$categoryCode';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data
          .map((wallpaperJson) => Wallpaper.fromJson(wallpaperJson))
          .toList();
    } else {
      throw Exception('Failed to get wallpapers by category');
    }
  }

  // Get random wallpapers for homepage (using "random" sorting)
  static Future<List<Wallpaper>> getRandomWallpapers() async {
    final url = '$baseUrl/search?apikey=$apiKey&sorting=random';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data
          .map((wallpaperJson) => Wallpaper.fromJson(wallpaperJson))
          .toList();
    } else {
      throw Exception('Failed to load random wallpapers');
    }
  }
}
