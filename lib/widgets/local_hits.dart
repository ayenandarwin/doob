
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Component/NewReleaseDetails.dart';

class LocalHits extends StatelessWidget {
  const LocalHits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'lib/Image/IGOR.jpg',
            width: 150,
            fit: BoxFit.cover,
            height: 150,
          ),
        ),
      ),
    );
  }
}