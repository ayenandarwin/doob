import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/SongCommentList/songcommentlist.dart';
import 'package:doob/Model/SongComments/songcomment.dart';
import 'package:doob/Model/SongList/songlist.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// final songCommentServiceProvider =
//     FutureProvider.family<SongCommentList?,String?>((ref,id) async {
//   final service = ref.watch(songCommentProvider);
//   final songCommentData = await service.getSongCommentInfo(id);
//   return songCommentData;
// });

final songCommentServiceProvider =
    FutureProvider.family<SongCommentList, String>((ref, id) async {
  final service = ref.watch(songCommentProvider);
  final songCommentData = await service.getSongCommentInfo(id);
  return songCommentData;
});


final songCommentProvider = Provider((ref) => SongService(Dio()));

class SongService {
  SongService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getSongCommentInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
    'https://doob.smartcodemm.com/api/customer/songs/$id/comments/list',
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = SongCommentList.fromJson(response.data);
    print('Album Api Result ^^^^^^^^^^^^ $request');

    return request;
  }
}
