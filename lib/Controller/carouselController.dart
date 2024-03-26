import 'package:get/get.dart';

class CustomCarouselController extends GetxController {
  var currentIndex = 0.obs;

  void addImageIndex( int index) {
    currentIndex(index);
  }
}
