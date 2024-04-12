import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/Album/album.dart';
import 'package:doob/Model/Albumlist/albumlist.dart';
import 'package:doob/Model/SongList/songlist.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final songServiceProvider = FutureProvider.autoDispose<SongList?>((ref) async {
  final service = ref.watch(songProvider);
  final songData = await service.getSongInfo();
  return songData;
});

final songProvider = Provider((ref) => SongService(Dio()));

class SongService {
  SongService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getSongInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      ApiUrl.songList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = SongList.fromJson(response.data);
    // print('Album Api Result ^^^^^^^^^^^^ $request');

    return request;
  }
}
