import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/Album/album.dart';
import 'package:doob/Model/Albumlist/albumlist.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final albumServiceProvider =
    FutureProvider.autoDispose<AlbumList?>((ref) async {
  final service = ref.watch(albumProvider);
  final albumData = await service.getAlbumInfo();
  return albumData;
});

final albumProvider = Provider((ref) => AlbumService(Dio()));

class AlbumService {
  AlbumService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getAlbumInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      ApiUrl.albumList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = AlbumList.fromJson(response.data);
   // print('Album Api Result ^^^^^^^^^^^^ $request');

    return request;
  }
}
