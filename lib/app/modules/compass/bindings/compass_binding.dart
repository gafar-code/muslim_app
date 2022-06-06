import 'package:get/get.dart';

import '../controllers/compass_controller.dart';

class CompassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompassController>(
      () => CompassController(),
    );
  }
}
