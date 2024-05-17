import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MusicBackgroundImage extends StatelessWidget {
  const MusicBackgroundImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            'https://cdn.wallpapersafari.com/64/93/hrC5Ge.jpg',
          ),
        ),
      ),
    );
  }
}
