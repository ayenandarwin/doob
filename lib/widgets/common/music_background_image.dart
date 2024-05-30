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
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              'https://th.bing.com/th/id/OIP.MziRVCm3N0MrEgyZQyVQygHaLH?w=115&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',
              //'https://cdn.wallpapersafari.com/64/93/hrC5Ge.jpg',
            ),
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
