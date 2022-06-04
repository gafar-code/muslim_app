import 'package:get/get.dart';

import '../controllers/dasboard_controller.dart';

class DasboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DasboardController>(
      () => DasboardController(),
    );
  }
}
