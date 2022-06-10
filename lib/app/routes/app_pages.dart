import 'package:get/get.dart';

import 'package:muslim_app/app/modules/time/bindings/compass_binding.dart';
import 'package:muslim_app/app/modules/time/views/time_view.dart';
import 'package:muslim_app/app/modules/dasboard/bindings/dasboard_binding.dart';
import 'package:muslim_app/app/modules/dasboard/views/dasboard_view.dart';
import 'package:muslim_app/app/modules/home/bindings/home_binding.dart';
import 'package:muslim_app/app/modules/home/views/home_view.dart';
import 'package:muslim_app/app/modules/quran/bindings/quran_binding.dart';
import 'package:muslim_app/app/modules/quran/views/quran_view.dart';

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
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPASS,
      page: () => TimeView(),
      binding: TimeBinding(),
    ),
    GetPage(
      name: _Paths.QURAN,
      page: () => QuranView(),
      binding: QuranBinding(),
    ),
  ];
}
