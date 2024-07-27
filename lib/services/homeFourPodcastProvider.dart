import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/HomeFourPodcastLists/homefourpodcastlist.dart';
import 'package:doob/Model/HomeFourSongLists/homefoursonglist.dart';
import 'package:doob/Model/SongList/songlist.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

final homeFourPodcastServiceProvider =
    FutureProvider.autoDispose<HomeFourPodcastList?>((ref) async {
  final service = ref.watch(homeFourPodcastProvider);
  final songData = await service.getHomeFourPodcastInfo();
  return songData;
});

final homeFourPodcastProvider = Provider((ref) => SongService(Dio()));

class SongService {
  SongService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getHomeFourPodcastInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      ApiUrl.homefourpodcast,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = HomeFourPodcastList.fromJson(response.data);
    // print('Album Api Result ^^^^^^^^^^^^ $request');

    return request;
  }

  Future<dynamic> likeCount(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      // "order_code": getResult,
    };

    final response = await _dio.post(
      'https://doob.smartcodemm.com/api/customer/songs/$id/react',
    );
    print("Hello Like ########################## : ${response.data}");
    return response.data;
  }
}
