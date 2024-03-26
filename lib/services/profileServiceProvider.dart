import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/Profile/profile.dart';
import 'package:doob/Model/ProfileList/profilelist.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../utils/global.dart';

final profileServiceProvider =
    FutureProvider.autoDispose<ProfileLists>((ref) async {
  final service = ref.watch(profileProvider);
  final requestData = await service.getUserInfo();
  return requestData;
});

final profileProvider = Provider((ref) => ProfileService(Dio()));

class ProfileService {
  ProfileService(this._dio);
  Dio _dio;

  Profile? userData;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getUserInfo() async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.get(
        ApiUrl.profile,
        options: Options(
          headers: <String, String>{
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': '$token',
          },
        ),
      );

      final profileInfo = ProfileLists.fromJson(response.data);
      print(" %%%%%%%%%%%% $profileInfo");
      return profileInfo;

      // print(response.data);
    } on DioError catch (dioError) {
      print("Error Occur $dioError");
      SharedPref.clear();
      isLoginController.logout();
      Global.loginStatus();
      Global.isLogIn = false;
      //Get.off(() => LoginScreen());
      Get.snackbar(
        "Alert",
        "သင်၏ အင်တာနက်လိုင်း အခက်အခဲကြောင့် အကောင့်ပြန်ဝင်ပါ",
        backgroundColor: Colors.redAccent,
      );
    }
  }
}
