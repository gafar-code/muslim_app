import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/views/hightlight.dart';
import 'package:muslim_app/app/modules/home/views/search.dart';
import 'package:muslim_app/app/modules/home/views/tabmenu.dart';
import 'package:muslim_app/theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_controller.dart';
import 'header.dart';
import 'patern.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: purpleColor,
      body: Stack(
        children: [
          PaternWidget(),
          SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                HeaderWidget(),
                SearchWidget(),
                HightLightWidget(),
              ],
            ),
          ),
          SlidingUpPanel(
            onPanelOpened: () => controller.panelState(true),
            onPanelClosed: () => controller.panelState(false),
            maxHeight: size.height - 40,
            minHeight: size.height - 320,
            boxShadow: [],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: greyColor,
            panelBuilder: (c) {
              return Obx(
                () => Column(
                  children: [
                    SizedBox(height: 18),
                    !controller.panelOpen.value
                        ? Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 4,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: grey2Color,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              SizedBox(height: 18),
                            ],
                          )
                        : Center(),
                    TabMenuWidget(),
                    Expanded(
                      child: ListView(
                        controller: c,
                        physics: BouncingScrollPhysics(),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 24),
                        children: [
                          Container(
                            height: 9000,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
