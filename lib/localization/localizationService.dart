import 'package:doob/localization/lang/en_us.dart';
import 'package:doob/localization/lang/my_MM.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'my_MM': myMM, // lang/tr_tr.dart
      };
}
