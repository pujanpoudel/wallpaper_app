class Wallpaper {
  final String id;
  final String imageUrl;
  final String thumbnailUrl;
  final String resolution;

  Wallpaper({
    required this.id,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.resolution,
  });

  factory Wallpaper.fromJson(Map<String, dynamic> json) {
    return Wallpaper(
      id: json['id'],
      imageUrl: json['path'],
      thumbnailUrl: json['thumbs']['large'],
      resolution: json['resolution'],
    );
  }
}
