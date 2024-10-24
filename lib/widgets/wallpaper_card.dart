import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/wallpaper_model.dart';
import '../screens/wallpaper_details_screen.dart';

class WallpaperCard extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperCard({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  WallpaperDetailsScreen(wallpaper: wallpaper)),
        );
      },
      child: Card(
        child: CachedNetworkImage(
          imageUrl: wallpaper.thumbnailUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
