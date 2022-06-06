import 'package:get/get.dart';

import '../controllers/quran_controller.dart';

class QuranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranController>(
      () => QuranController(),
    );
  }
}
