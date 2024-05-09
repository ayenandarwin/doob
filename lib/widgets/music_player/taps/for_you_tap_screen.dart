import 'package:flutter/material.dart';

import '../../../MusicPlayer/ForYouScreen.dart';

class ForYouTapScreen extends StatelessWidget {
  const ForYouTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        VideoForYouCard(),
        VideoForYouCard(),
        VideoForYouCard(),
        VideoForYouCard(),
        VideoForYouCard(),
        VideoForYouCard(),
        VideoForYouCard(),
      ],
    );
  }
}
