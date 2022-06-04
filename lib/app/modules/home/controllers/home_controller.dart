import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool panelOpen = false.obs;
  panelState(bool value) {
    panelOpen.value = value;
  }
}
