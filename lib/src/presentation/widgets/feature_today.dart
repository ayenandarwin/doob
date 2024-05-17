import 'package:flutter/material.dart';

import '../../../Component/PageIndicator.dart';

class FeatureToday extends StatelessWidget {
  const FeatureToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Featured Today',
            style: TextStyle(
                fontFamily: 'Century',
                //fontSize: 22,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PageIndicator(),
        )
      ],
    );
  }
}