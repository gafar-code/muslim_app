import 'package:get/get.dart';

import '../controllers/compas_controller.dart';

class CompasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompasController>(
      () => CompasController(),
    );
  }
}
