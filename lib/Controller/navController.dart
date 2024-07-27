
import 'dart:collection';
import 'package:get/get.dart';

class NaviController extends GetxController {
  static NaviController get to => Get.find();

  RxBool isBottomNavVisible = true.obs;
  var navigationQueue = ListQueue<int>().obs;
  var currentIndex = 0.obs;

  void toggleBottomNavVisibility(bool isVisible) {
    isBottomNavVisible.value = isVisible;
  }

  void addQueueLastToIndexandRemoveLastIndex() {
    currentIndex.value = navigationQueue.value.last;
    navigationQueue.value.removeLast();
  }

  void addIndexToQueueLast(int index) {
    navigationQueue.value.addLast(index);
  }

  void changePage(int _index) {
    currentIndex.value = _index;
    // Conditionally hide the bottom navigation bar
    if (_index == 2) {
      // Assuming index 2 is the page where you want to hide the bottom navigation bar
      isBottomNavVisible.value = false;
    } else {
      isBottomNavVisible.value = true;
    }
  }
}
