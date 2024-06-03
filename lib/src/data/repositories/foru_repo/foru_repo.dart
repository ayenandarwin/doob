import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/services/http/http_provider.dart';
import '../../../application/services/http/http_service.dart';
import '../../../domain/state/api_state.dart';

abstract class ForURepository {
  Future<dynamic> fetchForUMusics(String endPoint,
      {Map<String, dynamic>? params, Object? body});
}

class ForURepositoryImpl implements ForURepository {
  late final HttpService _httpService;

  ForURepositoryImpl(this._httpService);

  @override
  Future<ApiState> fetchForUMusics(String endPoint,
      {Map<String, dynamic>? params, Object? body}) async {
    final response =
        await _httpService.get(endPoint, queryParameters: params, body: body);
    print("Repo response : $response \n Endpoint : $endPoint");
    return response;
  }
}

final forURepositoryProvider = Provider<ForURepositoryImpl>((ref) {
  final httpService = ref.watch(httpProvider);

  return ForURepositoryImpl(httpService);
});
