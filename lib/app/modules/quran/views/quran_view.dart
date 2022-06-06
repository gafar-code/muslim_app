import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/views/index.dart';
import 'package:muslim_app/theme.dart';

import '../controllers/quran_controller.dart';
import 'header.dart';

class QuranView extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    Get.put(QuranController());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: greyColor,
          body: Stack(
            children: [
              IndexWidget(),
              HeaderWidget(),
            ],
          )),
    );
  }
}
