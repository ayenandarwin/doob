import 'package:flutter/material.dart';

import '../../../MusicPlayer/Follow.dart';

class FollowTapScreen extends StatelessWidget {
  const FollowTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        VideoFollowCard(),
        VideoFollowCard(),
        VideoFollowCard(),
        VideoFollowCard(),
        VideoFollowCard(),
        VideoFollowCard(),
        VideoFollowCard(),
      ],
    );
  }
}
