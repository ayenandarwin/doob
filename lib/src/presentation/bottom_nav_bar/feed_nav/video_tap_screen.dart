import 'package:flutter/material.dart';

import '../../../../MusicPlayer/videoplayer.dart';

class VideoTapScreen extends StatelessWidget {
  const VideoTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        VideoScreenCard(),
        VideoScreenCard(),
        VideoScreenCard(),
        VideoScreenCard(),
        VideoScreenCard(),
        VideoScreenCard(),
      ],
    );
  }
}
