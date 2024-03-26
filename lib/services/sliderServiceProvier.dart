import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Model/ArtistList/artistList.dart';
import 'package:doob/Model/Slider/slider.dart';
import 'package:doob/Model/SliderList/sliderlist.dart';
import 'package:doob/httpService/httpException.dart';
import 'package:doob/httpService/httpResponseHelper.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_core/src/get_main.dart';

final sliderServiceProvider =
    // FutureProvider.autoDispose<List<Slider>?>((ref) async {
    FutureProvider.autoDispose<SliderList?>((ref) async {
  final service = ref.watch(sliderProvider);
  final sliderData = await service.getSliderInfo();
  return sliderData;
});

final sliderProvider = Provider((ref) => SliderService(Dio()));

class SliderService {
  SliderService(this._dio);
  Dio _dio;

  //Process? process;

  final IsLoginController isLoginController = Get.put(IsLoginController());

  Future<dynamic> getSliderInfo() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await _dio.get(
      ApiUrl.sliderList,
      options: Options(
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      ),
    );
    final request = SliderList.fromJson(response.data);
    return request;
  }
}

// class SliderService {
//   SliderService();

//   Future<dynamic> getSliderInfo() async {
//     try {
//       final response = await http.get(Uri.parse(ApiUrl.sliderList));
//       final jsonData = ReturnResponse(response);
//       final sliderData = SliderList.fromJson(jsonData);
//       print('Slider Api ************ ${sliderData}');

//       return sliderData;
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//   }
// }
