import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int currentindex = 0;
  Widget currentPage = Home();

  void ChangeIndex(int Index) { 
    currentindex = Index;
    if (currentindex == 0) {
      currentPage = Home();
    } else if (currentindex == 1) {
      currentPage = Explore();
    } else
      () {
        currentPage = Library();
      };
    notifyListeners();
  }
}
