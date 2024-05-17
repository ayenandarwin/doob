
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Component/NewReleaseDetails.dart';

class TopChart extends StatelessWidget {
  const TopChart({
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
            'lib/Image/unforgiven.jpg',
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}