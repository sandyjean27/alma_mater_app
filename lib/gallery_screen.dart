import 'package:flutter/material.dart';

class GalleryItem {
  final String imageUrl;
  final String caption;

  GalleryItem({required this.imageUrl, required this.caption});
}

class GalleryScreen extends StatelessWidget {
  final List<GalleryItem> gallery = [
    GalleryItem(
      imageUrl: "https://example.com/photo1.jpg",
      caption: "Opening ceremony of the new school building.",
    ),
    GalleryItem(
      imageUrl: "https://example.com/photo2.jpg",
      caption: "Students during the regional quiz competition.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: gallery.length,
        itemBuilder: (context, index) {
          final item = gallery[index];
          return GestureDetector(
            onTap: () {
              // Full-screen image viewer can be added here
            },
            child: GridTile(
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(item.caption),
              ),
            ),
          );
        },
      ),
    );
  }
}
