import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/time/views/time_view.dart';
import 'package:muslim_app/app/modules/home/views/home_view.dart';
import 'package:muslim_app/app/modules/quran/views/quran_view.dart';

import '../controllers/dasboard_controller.dart';
import 'bottomnavbar.dart';

class DasboardView extends GetView<DasboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              HomeView(),
              TimeView(),
              QuranView(),
              Center(child: Text("Profle Page")),
            ],
          ),
        ),
        BottomNavbar(),
      ],
    ));
  }
}
