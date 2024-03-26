import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/ArtistList/artistList.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final artistServiceProvider =
    FutureProvider.autoDispose<ArtistList?>((ref) async {
  final service = ref.watch(artistProvider);
  final artistData = await service.getArtistInfo();
  return artistData;
});

final artistProvider = Provider((ref) => ArtistService(Dio()));

class ArtistService {
  ArtistService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getArtistInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      ApiUrl.artistList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = ArtistList.fromJson(response.data);
    return request;
  }
}
