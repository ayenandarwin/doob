import 'package:riverpod/riverpod.dart';

class PauseChangeProvider extends StateNotifier<bool> {
  Future _init() async {
    state = false;
  }

  PauseChangeProvider() : super(false) {
    _init();
  }

  isAudioPlay(bool isPlay) {
    state = isPlay;
  }
}

final pauseChangeProvider =
    StateNotifierProvider<PauseChangeProvider, bool>(
  (ref) => PauseChangeProvider(),
);
