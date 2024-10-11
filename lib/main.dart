import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/providers/mega_provider.dart';
import 'package:wallpaper_app/providers/wallpaper_provider.dart';
import 'package:wallpaper_app/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WallpaperProvider()),
        ChangeNotifierProvider(create: (_) => MegaProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
