import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/theme.dart';

class HeaderWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: size.width,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selamat datang',
                  style: lightTextStyle.copyWith(
                      fontSize: 9,
                      color: whiteColor,
                      fontWeight: FontWeight.w300)),
              SizedBox(height: 6),
              Text('Mirnawati',
                  style: boldTextStyle.copyWith(
                    color: whiteColor,
                    fontSize: 18,
                  )),
            ],
          ),
          Spacer(),
          SvgPicture.asset('assets/icons/notification_active.svg'),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(2),
            decoration:
                BoxDecoration(color: whiteColor, shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 28,
              child: Image.asset('assets/images/profile.png'),
            ),
          )
        ],
      ),
    );
  }
}
