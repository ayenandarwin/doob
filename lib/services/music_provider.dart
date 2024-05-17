/* import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:riverpod/riverpod.dart';

import '../Controller/isLoginController.dart';
import '../Model/SongList/songlist.dart';
import '../utils/constants.dart';
import '../utils/sharedPreference.dart';

class MusicProvider extends StateNotifier<SongList> {
  // SongService(this._dio);
  late Dio _dio;
   

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
    print('Hello I am music list ######## : $request');

    return request;
  }

  Future _init() async {
    getSongInfo();
  }

  MusicProvider() : super(SongList as SongList) {
    _init();
  }
}

final musicProvider = StateNotifierProvider<MusicProvider, SongList>(
  (ref) => MusicProvider(),
);
 */