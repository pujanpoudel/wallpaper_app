import 'package:flutter/material.dart';
import 'package:wallpaper_app/models/wallpaper_model.dart';
import 'package:wallpaper_app/screens/category_screen.dart';
import 'package:wallpaper_app/screens/favourite_screen.dart';
import 'package:wallpaper_app/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<List<Wallpaper>> wallpapers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    wallpapers = ApiService.fetchWallpapers();
    wallpapers.then((value) {
      print("Wallpapers fetched: ${value.length}");
    }).catchError((error) {
      print("Error fetching wallpapers: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: WallpaperSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          buildHomePage(),
          CategoriesScreen(),
          FavoritesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return FutureBuilder<List<Wallpaper>>(
      future: wallpapers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("Fetching wallpapers...");
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print("Error: ${snapshot.error}");
          return const Center(child: Text('Error fetching wallpapers'));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          print("Wallpapers received: ${snapshot.data!.length}");
          return buildHomePageContent(snapshot.data!);
        } else {
          return const Center(child: Text('No wallpapers found'));
        }
      },
    );
  }

  Widget buildHomePageContent(List<Wallpaper> wallpapers) {
    return Column(
      children: [
        // Best of the month section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Best of the month',
                  style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              TextButton(onPressed: () {}, child: Text('See all')),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wallpapers.length > 4 ? 4 : wallpapers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WallpaperCard(wallpaper: wallpapers[index]),
              );
            },
          ),
        ),

        // Color tone section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('The color tone',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(width: 50, color: Colors.pink),
              Container(width: 50, color: Colors.blue),
              Container(width: 50, color: Colors.green),
              Container(width: 50, color: Colors.yellow),
              // Add more colors here
            ],
          ),
        ),

        // Categories section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text('Categories', style: Theme.of(context).textTheme.titleLarge),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: wallpapers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return WallpaperCard(wallpaper: wallpapers[index]);
            },
          ),
        ),
      ],
    );
  }
}

class WallpaperSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Wallpaper>>(
      future: ApiService.searchWallpapers(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error searching wallpapers'));
        } else {
          return GridView.builder(
            itemCount: snapshot.data?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return WallpaperCard(wallpaper: snapshot.data![index]);
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search for wallpapers...'));
  }
}

class WallpaperCard extends StatelessWidget {
  final Wallpaper wallpaper;

  const WallpaperCard({super.key, required this.wallpaper});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        wallpaper.imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Icon(Icons.error));
        },
      ),
    );
  }
}
