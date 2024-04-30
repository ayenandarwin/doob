import 'package:riverpod/riverpod.dart';

class WaveIconTapChangeProvider extends StateNotifier<bool> {
  Future _init() async {
    state = true;
  }

  WaveIconTapChangeProvider() : super(true) {
    _init();
  }

  isAudioPlay(bool isPlay) {
    state = isPlay;
  }
}

final waveIconTapChangeProvider = StateNotifierProvider<WaveIconTapChangeProvider, bool>(
  (ref) => WaveIconTapChangeProvider(),
);