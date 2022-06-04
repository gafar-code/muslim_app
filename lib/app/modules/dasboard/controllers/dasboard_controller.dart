import 'package:get/get.dart';

class DasboardController extends GetxController {
  int currentIndex = 0;
  void changePage(int index) {
    currentIndex = index;
    update();
  }
}
