import 'package:dio/dio.dart';
import 'package:doob/Model/favReply.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../Controller/isLoginController.dart';

// final audioFavProvider =
//     FutureProvider.autoDispose.family<Success, String>((ref, id) async {
//  // const storage = FlutterSecureStorage();
//      final token = await SharedPref.getData(key: SharedPref.token);

//   //final token = await storage.read(key: 'token');
//   print(token!);
//   final url = Uri.parse('https://aptm-b.ethical-digit.com/audios/$id/favorite');
//   final response = await http.post(url, headers: {'Authorization': token});
//   if (response.statusCode == 200) {
//     print(response.body);
//     final json = jsonDecode(response.body);
//     return Success.fromJson(json);
//   } else {
//     throw Exception('Failed to retrieve book details.');
//   }
// });

final audioFavProvider =
    FutureProvider.family<Success?, String>((ref, id) async {
   final service = ref.watch(favIdProvider);
   final favIdData = await service.getFavIdInfo(id);
  return favIdData;
});

final favIdProvider = Provider((ref) => FavIdService(Dio()));

class FavIdService {
  FavIdService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getFavIdInfo(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      'https://doob.smartcodemm.com/api/customer/songs/$id/react',
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );

    final request = Success.fromJson(response.data);
    print(" ########### Song React $request");
    return request;
  }
}
