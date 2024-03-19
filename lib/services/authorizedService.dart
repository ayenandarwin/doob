import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:doob/error/dioErrorException.dart';
import 'package:doob/httpService/httpException.dart';
import 'package:doob/utils/global.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) {
    return AuthService(Dio());
  },
);

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<dynamic> login({
    required String phone,
    required String password,
  }) async {
    try {
      var encodeJson = json.encode({
        'phone': phone,
        'password': password,
      });
      print(encodeJson);
      var response = await http
          .post(Uri.parse(ApiUrl.loginUrl), body: encodeJson, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      });
      var userData = jsonDecode(response.body);
      print('************ ${response.body}');
      return userData;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> register({
    required String name,
    required String phone,
    required String password,
    // required String confirm_password,
    // required String email,
  }) async {
    print(ApiUrl.registerUrl);
    try {
      var encodeJson = json.encode({
        'name': name,
        'phone': phone,
        'password': password,
        // 'password_confirmation': confirm_password,
        //'email': email,
      });
      var response = await http
          .post(Uri.parse(ApiUrl.registerUrl), body: encodeJson, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      });

      var userData = jsonDecode(response.body);
      print("Resgiration response *********** ${response.body}");
      return userData;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> editPhone({
    required String phone,
  }) async {
    try {
      var encodeJson = json.encode({
        'phone': phone,
      });

      final token = await SharedPref.getData(key: SharedPref.token);
      var response = await http.post(
        Uri.parse(ApiUrl.editProfile),
        body: encodeJson,
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': '$token',
        },
      );
      var editPhone = jsonDecode(response.body);
      return editPhone;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> changePassword({
    required String old_password,
    required String new_password,
    required String confirm_password,
  }) async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(ApiUrl.passwordResetUrl,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$token',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'currentPassword': old_password,
            'password': new_password,
            'confirmPassword': confirm_password,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> update({
    // required String fullName,
    // required String loginName,
    required String phone,
    // required String address,
    // required String state,
    // required String township,
  }) async {
    print(ApiUrl.editProfile);
    final token = await SharedPref.getData(key: SharedPref.token);
    try {
      var encodeJson = json.encode({
        // 'full_name': fullName,
        // 'login_name': loginName,
        'phone': phone,
        // 'address': address,
        // 'state': state,
        // 'township': township,
      });
      print(encodeJson);
      var response = await http.post(Uri.parse(ApiUrl.editProfile), body: {
        // 'full_name': fullName,
        // 'login_name': loginName,
        'phone': phone,
        // 'address': address,
        // 'state': state,
        // 'township': township,
      }, headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': '$token',
      });
      var userData = jsonDecode(response.body);
      return userData;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> forgetPassword({
    required String phone,
  }) async {
    try {
      final token = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(ApiUrl.forgetPassword,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$token',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'phone': phone,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> checkToken({
    required String token,
    required String phone,
  }) async {
    try {
      final response = await _dio.post(ApiUrl.checkToken,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'two_factor_code': int.parse(token),
            'phone': phone,
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }

  Future<dynamic> registerFirstStep({
    required String phone,
  }) async {
    var encodeJson = json.encode({
      'phone': phone,
    });
    print(encodeJson);
    var response = await http.post(
      Uri.parse(ApiUrl.signUpFirstStepUrl),
      body: {"phone": phone},
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    var userData = jsonDecode(response.body);
    return userData;
  }

  Future<dynamic> referralCodeCheck({
    required String referralCode,
  }) async {
    var encodeJson = json.encode({
      'referral_code': referralCode,
    });
    print(encodeJson);
    var response = await http.post(
      Uri.parse(ApiUrl.referralCodeCheck),
      body: {"referral_code": referralCode},
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
      },
    );
    var userData = jsonDecode(response.body);
    return userData;
  }

  Future<dynamic> resetPassword({
    required String phone,
    required String password,
    required String password_confirmation,
    required String token,
  }) async {
    try {
      final logintoken = await SharedPref.getData(key: SharedPref.token);
      final response = await _dio.post(ApiUrl.resetPassword,
          options: Options(
            validateStatus: (_) => true,
            followRedirects: false,
            headers: <String, String>{
              'Accept': 'application/json; charset=UTF-8',
              'Authorization': '$logintoken',
            },
          ),
          data: jsonEncode(<String, dynamic>{
            'phone': phone,
            'password': password,
            'password_confirmation': password_confirmation,
            'token': token
          }));
      return response;
    } on DioError catch (dioError) {
      print(" password reset error ===   " +
          DioErrException.fromDioError(dioError).message);
    }
  }
}
