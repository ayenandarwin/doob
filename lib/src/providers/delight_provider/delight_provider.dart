import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
import 'package:doob/src/data/repositories/music_repo/music_repository.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/util/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/song_obj.dart';

class DelightProvider extends StateNotifier<ApiState> {
  DelightProvider(DelightRepository delightRepo)
      : delightRepository = delightRepo,
        super(InitialState()) {
    fetchMusics();
  }

  late final DelightRepository delightRepository;

  Future<void> fetchMusics(
      {Map<String, dynamic>? param, Map<String, dynamic>? body}) async {
    state = LoadingState();
    final response = await delightRepository.fetchMusics(baseUrl + delight);

    if (mounted) {
      if (response is SuccessState) {
        print("Success Data : ${response.data}");
        final responseData = _parseList(response.data['data']);
        //print("Songs Data : ${responseData![2].likeCount}");
        state = SuccessState(responseData);
      } else {
        state = ErrorState("Something Wrong", ErrorType.unknown);
      }
      print("Music Detail State is .............. : ${response}");
    }
  }
}

List<Data>? _parseList(List<dynamic> data) {
  print("I am data : $data");
  return List.from(data).map((dynamic e) => Data.fromJson(e)).toList();
}
