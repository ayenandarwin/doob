import 'package:riverpod/riverpod.dart';

import '../../../application/services/http/http_provider.dart';
import '../../../application/services/http/http_service.dart';
import '../../../domain/state/api_state.dart';

abstract class CommentRepository {
  Future<dynamic> fetchCommentList(String endPoint, {Map<String, dynamic>? params, Object? body});
   Future<dynamic> createComment(String endPoint, {Map<String, dynamic>? params, Object? body});
}

class CommentRepositoryImpl implements CommentRepository {
  late final HttpService _httpService;

  CommentRepositoryImpl(this._httpService);

  @override
  Future<ApiState> fetchCommentList(String endPoint, {Map<String, dynamic>? params, Object? body}) async {
    final response = await _httpService.get(endPoint, queryParameters: params, body: body);
    print("Repo response : $response \n Endpoint : $endPoint");
    return response;
  }

  Future<ApiState> createComment(String endPoint, {Map<String, dynamic>? params, Object? body}) async {
    final response = await _httpService.post(endPoint, queryParameters: params, body: body);
    print("Repo response : $response \n Endpoint : $endPoint");
    return response;
  }
}

final commentRepositoryProvider = Provider<CommentRepositoryImpl>((ref) {
  final httpService = ref.watch(httpProvider);

  return CommentRepositoryImpl(httpService);
});
