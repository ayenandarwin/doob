import 'package:doob/src/data/repositories/music_repo/comment_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/state/api_state.dart';

class CommentProvider extends StateNotifier<ApiState> {
  CommentProvider(CommentRepository commentRepo)
      : commentRepository = commentRepo,
        super(InitialState()) {}

  late final CommentRepository commentRepository;
  fetchComment(String id) async {
    print("Comment ...... id  : $id");
    state = LoadingState();
    final response = await commentRepository.fetchCommentList("https://doob.smartcodemm.com/api/customer/songs/$id/comments/list");
    print("Cmt response : ${response}");
    if (response is SuccessState) {
      final responseData = response.data["data"];

      return responseData;
    } else {
      state = ErrorState("Something Wrong", ErrorType.unknown);
    }
  }

  Future<dynamic> addComment(String id, {Map<String, dynamic>? body}) async {
    print("Comment ...... id post  : $id");
    state = LoadingState();
    final response = await commentRepository.createComment("https://doob.smartcodemm.com/api/customer/songs/$id/comments/create", body: body);
    if (response is SuccessState) {
      final responseData = response.data["data"];
      return responseData;
    } else {
      state = ErrorState("Something Wrong", ErrorType.unknown);
    }
  }
}
