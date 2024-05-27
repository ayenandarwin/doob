import 'package:doob/Component/NewReleaseDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewRelese extends StatelessWidget {
  const NewRelese({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
        padding: EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/Image/middle.jpg',
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
