import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/ArtistIdList/artistidList.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


final artistIdServiceProvider =
    FutureProvider.family<ArtistIdLists?, String>((ref, id) async {
  final service = ref.watch(artistIdProvider);
  final artistIdData = await service.getArtistIdInfo(id);
  return artistIdData;
});

final artistIdProvider = Provider((ref) => ArtistIdService(Dio()));

class ArtistIdService {
  ArtistIdService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getArtistIdInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      'https://doob.smartcodemm.com/api/customer/artists/$id',
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );

    final request = ArtistIdLists.fromJson(response.data);
    print(" ########### Album id result $request");
    return request;
  }
}
