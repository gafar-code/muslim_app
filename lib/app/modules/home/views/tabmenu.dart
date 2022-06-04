import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/theme.dart';

class TabMenuWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 64,
      width: size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                _item(true,
                    image: 'assets/icons/trend.svg', title: 'Untuk anda'),
                _item(false,
                    image: 'assets/icons/trend.svg', title: 'Mengikuti'),
                _item(false, image: 'assets/icons/trend.svg', title: 'Live'),
                _item(false, image: 'assets/icons/trend.svg', title: 'Doa'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _item(bool isSelected,
      {required String title, required String image}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected ? cyanColor : whiteColor,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 36,
      child: Center(
          child: Row(
        children: [
          isSelected ? SvgPicture.asset(image) : Center(),
          SizedBox(width: 4),
          Text(title,
              style: regularTextStyle.copyWith(
                color: isSelected ? whiteColor : blackColor,
              )),
        ],
      )),
    );
  }
}
