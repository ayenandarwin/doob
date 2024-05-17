import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/services/http/http_provider.dart';
import '../../../application/services/http/http_service.dart';
import '../../../domain/state/api_state.dart';

abstract class LikeCountRepository {
  Future<dynamic> updateLikeCount(String endPoint);

  
}

class LikeCountRepositoryImpl implements LikeCountRepository {
  late final HttpService _httpService;

  LikeCountRepositoryImpl(this._httpService);

  @override
  Future<ApiState> updateLikeCount(String endPoint) async {
    final response = await _httpService.post(endPoint);
    print("Repo response : $response \n Endpoint : $endPoint");
    return response;
  }

  
}

final likeCountRepositoryProvider = Provider<LikeCountRepositoryImpl>((ref) {
  final httpService = ref.watch(httpProvider);

  return LikeCountRepositoryImpl(httpService);
});
