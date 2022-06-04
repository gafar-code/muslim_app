import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/views/home_view.dart';

import '../controllers/dasboard_controller.dart';
import 'bottomnavbar.dart';

class DasboardView extends GetView<DasboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        IndexedStack(
          index: controller.currentIndex,
          children: [
            HomeView(),
            Center(child: Text("Compas Page")),
            Center(child: Text("Quran Page")),
            Center(child: Text("Profle Page")),
          ],
        ),
        BottomNavbar(),
      ],
    ));
  }
}
