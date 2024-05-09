import 'package:flutter/material.dart';

class MusicBackgroundImage extends StatelessWidget {
  const MusicBackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        imageUrl,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              'https://cdn.wallpapersafari.com/64/93/hrC5Ge.jpg',
            ),
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
