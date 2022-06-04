import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';

class PaternWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/images/patern.png',
                  fit: BoxFit.fill,
                )),
          )
        ],
      ),
    );
  }
}
