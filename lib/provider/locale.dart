import 'package:doob/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale(Hive.box("Language").get('lang'));

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    Hive.box("Language").put('lang', locale.languageCode);
    _locale = locale;
    notifyListeners();
  }
}
