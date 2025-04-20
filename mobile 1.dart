import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive GridView Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageGridScreen(),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  // Sample list of image URLs (online)
  final List<String> imageUrls = [
    'https://picsum.photos/id/1015/400/300',
    'https://picsum.photos/id/1016/400/300',
    'https://picsum.photos/id/1018/400/300',
    'https://picsum.photos/id/1020/400/300',
    'https://picsum.photos/id/1024/400/300',
    'https://picsum.photos/id/1027/400/300',
  ];

  // For local assets, you can also add:
  final List<String> localImages = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth ~/ 200).clamp(
      2,
      6,
    ); // Adjust columns based on width

    return Scaffold(
      appBar: AppBar(title: Text('Responsive Image Grid')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4 / 3,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrls[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
