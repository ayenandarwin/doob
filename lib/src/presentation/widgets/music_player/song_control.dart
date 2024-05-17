import 'package:doob/src/providers/wave_icon_provider/wave_icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

import '../../../../Component/playerButton.dart';

class SongControl extends StatelessWidget {
  const SongControl({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Consumer(builder: (context, waveIconRef, child) {
        final tapChange = waveIconRef.watch(waveIconTapChangeProvider);
        return Container(
          margin: EdgeInsets.only(top: size.height * 0.68),
          child: Center(
            child: Stack(
              children: [
                tapChange
                    ? Positioned(
                        top: 8,
                        left: 40,
                        child: Center(
                          child: Container(
                            width: size.width * 0.68,
                            child: Lottie.asset(
                              'asset/lottie/Animation - 1713755104463.json',
                            ),
                          ),
                        ))
                    : SizedBox.shrink(),
                //PlayerButtons(audioPlayer),
              ],
            ),
          ),
        );
      }),
    );
  }
}
