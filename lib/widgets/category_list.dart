import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.folder),
          title: Text('Category $index'),
          onTap: () {
            // Navigate to category wallpapers
          },
        );
      },
    );
  }
}
