import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Constants {
  static Color gray = const Color(0xffd2d6de);
  static Color red = const Color(0xffa94442);
  static Color blue = const Color(0xff3c8dbc);
  static Color profileBlue = const Color(0xff045079);

 

  static const kGradient = LinearGradient(colors: [
    Color(0xffAf69Ef),
    Color(0xffDE7CEB),
  ], begin: Alignment.centerLeft, end: Alignment.centerRight);

  static double tDefaultSize = 14;
  static double tSmallSize = 12;
}
