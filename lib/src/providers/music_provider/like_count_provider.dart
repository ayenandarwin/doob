import 'package:doob/src/data/repositories/music_repo/like_count_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/state/api_state.dart';

class LikeCountProvider extends StateNotifier<ApiState> {
  LikeCountProvider(LikeCountRepository likeCountRepo)
      : likeCountRepository = likeCountRepo,
        super(InitialState()) {
    //updateLikeCount();
  }

  late final LikeCountRepository likeCountRepository;

  Future<void> updateLikeCount(String songId) async {
    print("Like Count Provider state .............. : ${songId}");
    state = LoadingState();
    final response = await likeCountRepository.updateLikeCount("https://doob.smartcodemm.com/api/customer/songs/$songId/react");
    if (response is SuccessState) {
      print("Success Data Like Count : ${response.data["data"]}");
      state = SuccessState(response.data["data"]);
    } else {
      state = ErrorState("Something Wrong", ErrorType.unknown);
    }
    print("Like Count Provider state .............. : ${response}");
  }
}
