import 'package:flutter/material.dart';
import 'package:wallpaper_app/widgets/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: CategoryList(),
    );
  }
}
