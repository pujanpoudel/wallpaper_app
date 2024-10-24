import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/wallpaper_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List> wallpapers;

  @override
  void initState() {
    super.initState();
    wallpapers = ApiService.fetchWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
      ),
      body: FutureBuilder<List>(
        future: wallpapers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching wallpapers'));
          } else {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return WallpaperCard(wallpaper: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
