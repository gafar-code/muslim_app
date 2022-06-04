import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/modules/home/controllers/home_controller.dart';
import 'package:muslim_app/theme.dart';

class SearchWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 60,
        width: size.width,
        padding: EdgeInsets.fromLTRB(20, 0, 6, 0),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/search.svg'),
            SizedBox(width: 20),
            Text('Cari Kajian menarik...',
                style:
                    regularTextStyle.copyWith(color: grey2Color, fontSize: 14)),
            Spacer(),
            CircleAvatar(
              radius: 24,
              backgroundColor: cyanColor,
              child: SvgPicture.asset('assets/icons/setting_adjust.svg'),
            )
          ],
        ),
      ),
    );
  }
}
