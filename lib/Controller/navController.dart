import 'dart:collection';
import 'package:get/get.dart';

class NaviController extends GetxController {
  static NaviController get to => Get.find();
  RxDouble scrollOffsetCoinDetail = (0.0).obs;
  RxDouble position = (0.0).obs;
  RxDouble sentitivityFactor = (20.0).obs;
  // RxBool isShowLoginSignUp = false.obs;


  RxBool isBottomNavVisible = true.obs;
  var navigationQueue = ListQueue<int>().obs;

  var currentIndex = 0.obs;

  void toggleBottomNavVisibility(bool isVisible) {
    isBottomNavVisible.value = isVisible;
  }

  void addQueueLastToIndexandRemoveLastIndex() {
    currentIndex = navigationQueue.value.last.obs;
    navigationQueue.value.removeLast();
  }

  void addIndexToQueueLast(int index) {
    navigationQueue.value.addLast(index);
  }

  // Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
}
