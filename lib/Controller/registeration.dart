import 'dart:convert';
//import 'dart:js';

import 'package:doob/services/authorizedService.dart';
import 'package:doob/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterationController extends GetxController {
  // TextEditingController nameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithPhone() async {
    try {
      var headers = {'Content-type': 'application/json'};
      var url = Uri.parse(ApiUrl.mainUrl + ApiUrl.registerUrl);

      Map body = {
        'name': nameController.text,
        'phone': phoneController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        } else {
          throw jsonDecode(response.body)['register_type'] ??
              'Unknown Error Occured';
        }
      } else {
        throw jsonDecode(response.body)['register_type'] ??
            'Unknown Error Occured';
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  Future<String> authenticateWithGoogle({required BuildContext context}) async {
    String token = "";
    try {
      token = await AuthService.signInWithGoogle();
    } on NoGoogleAccountChosenException {
      // return;
    } catch (e) {
      if (!context.mounted)
        //return;
        AlertDialog(
          content: Text('An unknown error occured'),
        );
    }
    return token;
  }

  Future<String> authenticateWithFacebook(
      {required BuildContext context}) async {
    String token = "";
    try {
      token = await AuthService.signInWithFacebook();
    } on NoFacebookAccountChosenException {
      // return;
    } catch (e) {
      if (!context.mounted)
        //return;
        AlertDialog(
          content: Text('An unknown error occured'),
        );
    }
    return token;
  }
}

class NoGoogleAccountChosenException implements Exception {
  const NoGoogleAccountChosenException();
}

class NoFacebookAccountChosenException implements Exception {
  const NoFacebookAccountChosenException();
}
