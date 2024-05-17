import 'package:flutter/material.dart';


class Devotional extends StatelessWidget {
  const Devotional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'lib/Image/IGOR.jpg',
        fit: BoxFit.cover,
        width: 150,
        height: 150,
      ),
    );
  }
}

