import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/wallpaper_model.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperDetailsScreen({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper Details'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: wallpaper.imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
