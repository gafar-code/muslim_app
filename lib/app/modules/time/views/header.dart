import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/time/controllers/time_controller.dart';
import 'package:muslim_app/app/modules/time/views/detail/detail_view.dart';
import 'package:muslim_app/theme.dart';

class HeaderWidget extends GetView<TimeController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: whiteColor, boxShadow: [
        BoxShadow(
            blurRadius: 40,
            offset: Offset(0, 10),
            color: blackColor.withOpacity(0.08))
      ]),
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      height: 140,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('lokasi anda sekarang',
                    style: regularTextStyle.copyWith(fontSize: 12)),
                SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    SizedBox(width: 8),
                    Text('Kota Jakarta',
                        style: mediumTextStyle.copyWith(fontSize: 18))
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(DetailView()),
            child: Image.asset(
              'assets/images/compas.png',
              height: 60,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}
