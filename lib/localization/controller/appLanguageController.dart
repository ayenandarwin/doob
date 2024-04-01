import 'package:doob/localization/controller/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLanguageController extends GetxController {
  var appLocale = 'my_MM';

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    LocalStorage localStorage = LocalStorage();

    appLocale = await localStorage.languageSelected == null ||
            localStorage.languageSelected == ''
        ? 'my_MM'
        : await localStorage.languageSelected;
    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();

    if (appLocale == type) {
      return;
    }
    if (type == 'en_US') {
      appLocale = 'en_US';
      localStorage.saveLanguageToDisk('en_US');
    } else if (type == "my_MM") {
      appLocale = 'my_MM';
      localStorage.saveLanguageToDisk('my_MM');
    } else {
      appLocale = 'my_MZ';
      localStorage.saveLanguageToDisk('my_MZ');
    }
    update();
  }
}
