import 'package:get/get.dart';

class DasboardController extends GetxController {
  RxInt currentIndex = 2.obs;
  void changePage(int index) {
    currentIndex.value = index;
  }
}
