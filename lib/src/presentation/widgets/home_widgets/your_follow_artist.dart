
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Component/ArtistDetail.dart';

class YourFollowArtist extends StatelessWidget {
  const YourFollowArtist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ArtistsDetails());
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'lib/Image/jojipf.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Joji',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Century', color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}