import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/AlbumIdLists/albumidlists.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// final albumIdServiceProvider =
//     FutureProvider.autoDispose<AlbumIdList?>((ref) async {
//   final service = ref.watch(AlbumIdProvider);
//   final AlbumIdData = await service.getAlbumIdInfo();
//   return AlbumIdData;
// });

final albumIdServiceProvider =
    FutureProvider.family<AlbumIdLists?, String>((ref, id) async {
  final service = ref.watch(albumIdProvider);
  final albumIdData = await service.getAlbumIdInfo(id);
  return albumIdData;
});

final albumIdProvider = Provider((ref) => AlbumIdService(Dio()));

class AlbumIdService {
  AlbumIdService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getAlbumIdInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      'https://doob.smartcodemm.com/api/customer/albums/$id',
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );

    final request = AlbumIdLists.fromJson(response.data);
    print(" ########### Album id result $request");
    return request;
  }
}
