import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/quran/controllers/quran_controller.dart';
import 'package:muslim_app/theme.dart';

class HeaderWidget extends GetView<QuranController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      height: 140,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: Get.back, icon: Icon(CupertinoIcons.arrow_left)),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('At-Taubah',
                style: regularTextStyle.copyWith(fontSize: 18)),
          ),
          GestureDetector(
            onTap: Get.back,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset('assets/icons/more_quran2.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
