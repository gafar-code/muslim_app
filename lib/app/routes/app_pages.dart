import 'package:get/get.dart';

import 'package:muslim_app/app/modules/compas/bindings/compas_binding.dart';
import 'package:muslim_app/app/modules/compas/views/compas_view.dart';
import 'package:muslim_app/app/modules/dasboard/bindings/dasboard_binding.dart';
import 'package:muslim_app/app/modules/dasboard/views/dasboard_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASBOARD;

  static final routes = [
    GetPage(
      name: _Paths.DASBOARD,
      page: () => DasboardView(),
      binding: DasboardBinding(),
    ),
    GetPage(
      name: _Paths.COMPAS,
      page: () => CompasView(),
      binding: CompasBinding(),
    ),
  ];
}
