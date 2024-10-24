import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/wallpaper_model.dart';

class ApiService {
  static String apiKey = dotenv.env['API_KEY'] ?? '';

  static String baseUrl = 'https://wallhaven.cc/api/v1/search?apikey=$apiKey';

  static Future<List<Wallpaper>> fetchWallpapers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data
          .map((wallpaperJson) => Wallpaper.fromJson(wallpaperJson))
          .toList();
    } else {
      throw Exception('Failed to load wallpapers');
    }
  }
}
