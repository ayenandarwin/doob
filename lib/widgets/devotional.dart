import 'package:flutter/material.dart';

class Devotional extends StatelessWidget {
  const Devotional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/IGOR.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );

    // Container(
    //   child: Image.asset(
    //     'lib/Image/IGOR.jpg',
    //     fit: BoxFit.cover,
    //     width: 150,
    //     height: 150,
    //   ),
    // );
  }
}
