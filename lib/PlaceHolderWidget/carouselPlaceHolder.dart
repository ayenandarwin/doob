
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselPlaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: AspectRatio(
          aspectRatio: 18 / 9,
          child: Container(
            color: Colors.grey[300],
          ),
      ),
    );
  }
}
